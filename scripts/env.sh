#!/bin/bash

# Firebase
export FIREBASE_PROD_ANDROID_APP_ID="1:515471863664:android:1b49d90cfef634f10d29b5"
export FIREBASE_STAGING_ANDROID_APP_ID="1:515471863664:android:99dc9b9e5c0211fe0d29b5"
export FIREBASE_PROD_IOS_APP_ID="1:515471863664:ios:93569b7473232a120d29b5"
export FIREBASE_TESTER_GROUP="my-testers-group"



# iOS
# Project options
export SCHEME_NAME=CiCdReactNative
export CONFIGURATION=Release
export PROVISIONING_PROFILE_NAME="Github Actions nitro.build"
export WORKSPACE_PATH=ios/CiCdReactNative.xcworkspace
export ARCHIVE_PATH="./build/${CONFIGURATION}/${SCHEME_NAME}.xcarchive"
export KEYCHAIN_NAME=tmp.keychain
export CERTIFICATE_PATH=tmp_cert.p12
export PROVISIONING_PROFILE_PATH="tmp.mobileprovision"
export DEVELOPMENT_TEAM="ZXB65YLHFM"
export DESTINATION="generic/platform=iOS"
export TMP_EXPORT_OPTIONS_PLIST="TmpExportOptions.plist"
