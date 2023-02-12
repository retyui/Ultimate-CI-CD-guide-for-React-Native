#!/bin/bash

set -e # Exit with nonzero exit code if anything fails

if [[ -z "$FIREBASE_TOKEN" ]]
then
  echo "Secret FIREBASE_TOKEN is not set (use: 'npx firebase-tools login:ci' to generate one)"
  exit 1
fi

if [[ -z "$APP_ID" ]]
then
  echo "APP_ID is not set"
  exit 1
fi

if [[ -z "$FIREBASE_TESTER_GROUP" ]]
then
  echo "FIREBASE_TESTER_GROUP is not set"
  exit 1
fi

if [[ ! -f "$APK_OR_IPA_PATH" ]]
then
  echo "APK_OR_IPA_PATH: $APK_OR_IPA_PATH file does not exist"
  exit 1
fi


# Docs:
#  android: https://firebase.google.com/docs/app-distribution/android/distribute-cli?apptype=apk
#  ios: https://firebase.google.com/docs/app-distribution/ios/distribute-cli
npx firebase-tools appdistribution:distribute "$APK_OR_IPA_PATH" \
  --app "$APP_ID" \
  --release-notes "$RELEASE_NOTES" \
  --groups "$FIREBASE_TESTER_GROUP"
