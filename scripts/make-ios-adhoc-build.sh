#!/bin/bash

set -e # Exit with nonzero exit code if anything fails
set -x # Print commands

source ./scripts/env.sh

if [[ -z "$IOS_DISTRIBUTION_CERTIFICATE_BASE64" ]]
then
  echo "Secret IOS_DISTRIBUTION_CERTIFICATE_BASE64 is not set"
  exit 1
fi
if [[ -z "$IOS_ADHOC_PROVISIONING_PROFILE_BASE64" ]]
then
  echo "Secret IOS_ADHOC_PROVISIONING_PROFILE_BASE64 is not set"
  exit 1
fi
if [[ -z "$IOS_DISTRIBUTION_CERTIFICATE_PASSWORD" ]]
then
  echo "Secret IOS_ADHOC_PROVISIONING_PROFILE_BASE64 is not set"
  exit 1
fi
if [[ -z "$IPA_OUTPUT_PATH" ]]
then
  echo "Secret IOS_ADHOC_PROVISIONING_PROFILE_BASE64 is not set"
  exit 1
fi
if [[ -z "$EXPORT_METHOD" ]]
then
  echo "Secret IOS_ADHOC_PROVISIONING_PROFILE_BASE64 is not set"
  exit 1
fi

# Configure tmp Keychain
if [[ ! -z "$CI" ]]
then
  security create-keychain -p "" "$KEYCHAIN_NAME"
  security list-keychains -s "$KEYCHAIN_NAME"
  security default-keychain -s "$KEYCHAIN_NAME"
  security unlock-keychain -p "" "$KEYCHAIN_NAME"
  security set-keychain-settings
  security list-keychains
fi

# Decode & Import cert
echo "$IOS_DISTRIBUTION_CERTIFICATE_BASE64" | base64 --decode > "$CERTIFICATE_PATH"
security import "$CERTIFICATE_PATH" -k "$KEYCHAIN_NAME" -P "$IOS_DISTRIBUTION_CERTIFICATE_PASSWORD" -A

# Decode and move provision profile
echo "$IOS_ADHOC_PROVISIONING_PROFILE_BASE64" | base64 --decode > "$PROVISIONING_PROFILE_PATH"
mkdir -p "$HOME/Library/MobileDevice/Provisioning Profiles"
UUID=`/usr/libexec/PlistBuddy -c 'Print :UUID' /dev/stdin <<< $(security cms -D -i $PROVISIONING_PROFILE_PATH)`
cp "$PROVISIONING_PROFILE_PATH" "$HOME/Library/MobileDevice/Provisioning Profiles/$UUID.mobileprovision"
# update entitlement and query entitlement and query provisioning profile
/usr/libexec/PlistBuddy -c "Clear" "$TMP_EXPORT_OPTIONS_PLIST"
/usr/libexec/PlistBuddy -c "Add method string $EXPORT_METHOD" "$TMP_EXPORT_OPTIONS_PLIST"
/usr/libexec/PlistBuddy -c "Add :signingStyle string manual" "$TMP_EXPORT_OPTIONS_PLIST"
/usr/libexec/PlistBuddy -c "Add :provisioningProfiles dict" "$TMP_EXPORT_OPTIONS_PLIST"
/usr/libexec/PlistBuddy -c "Add :provisioningProfiles:com.cicdreactnative string $PROVISIONING_PROFILE_NAME" "$TMP_EXPORT_OPTIONS_PLIST"
/usr/bin/security cms -D -i "$PROVISIONING_PROFILE_PATH"

# Archive & Export
xcodebuild archive \
  -workspace "$WORKSPACE_PATH" \
  -scheme "$SCHEME_NAME" \
  -configuration "$CONFIGURATION" \
  -destination "$DESTINATION" \
  -archivePath "$ARCHIVE_PATH" \
  CODE_SIGN_IDENTITY="iPhone Distribution" \
  DEVELOPMENT_TEAM=ZXB65YLHFM \
  PROVISIONING_PROFILE_SPECIFIER="Github Actions nitro.build" \
  CODE_SIGN_STYLE=Manual && \
xcodebuild -exportArchive \
  -archivePath "$ARCHIVE_PATH" \
  -exportPath "$IPA_OUTPUT_PATH" \
  -exportOptionsPlist "$TMP_EXPORT_OPTIONS_PLIST" \

