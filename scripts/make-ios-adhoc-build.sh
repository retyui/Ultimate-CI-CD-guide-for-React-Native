#!/bin/bash

set -e # Exit with nonzero exit code if anything fails
set -x # Print commands

source ./scripts/env.sh

xcodebuild archive -workspace "$WORKSPACE_PATH" -scheme "$SCHEME_NAME" -configuration "$CONFIGURATION" -archivePath "$ARCHIVE_PATH" && \
xcodebuild -exportArchive -archivePath "$ARCHIVE_PATH" -exportPath "$IPA_OUTPUT_PATH" -exportFormat ipa -exportProvisioningProfile "$PROVISIONING_PROFILE_NAME"
