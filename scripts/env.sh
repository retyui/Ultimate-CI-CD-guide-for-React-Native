#!/bin/bash

# Firebase
export FIREBASE_PROD_ANDROID_APP_ID="1:515471863664:android:1b49d90cfef634f10d29b5"
export FIREBASE_STAGING_ANDROID_APP_ID="1:515471863664:android:99dc9b9e5c0211fe0d29b5"
export FIREBASE_PROD_IOS_APP_ID="1:515471863664:ios:93569b7473232a120d29b5"
export FIREBASE_TESTER_GROUP="my-testers-group"



# iOS
export SCHEME_NAME=CiCdReactNative
export CONFIGURATION=Release
export PROVISIONING_PROFILE_NAME="test"
export IPA_OUTPUT_PATH="./CiCdReactNative.ipa"
export ARCHIVE_PATH="./build/${CONFIGURATION}/${SCHEME_NAME}.xcarchive"
export WORKSPACE_PATH=ios/CiCdReactNative.xcworkspace
