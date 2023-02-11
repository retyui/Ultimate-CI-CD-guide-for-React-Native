#!/bin/bash

set -e # Exit with nonzero exit code if anything fails
set -x # Print commands

if [[ -z "$BRANCH_NAME" ]]
then
  echo "BRANCH_NAME is not set"
  exit 1
fi

export RELEASE_VERSION="1.0.0+$BRANCH_NAME"
export RUN_ANDROID_BUILD_COMMAND="./android/gradlew assembleRelease --no-daemon -p android"

if [[ ! -z "$REACT_NATIVE_ARCHITECTURES" ]]
then
  export RUN_ANDROID_BUILD_COMMAND="$RUN_ANDROID_BUILD_COMMAND -PreactNativeArchitectures=$REACT_NATIVE_ARCHITECTURES"
fi

$RUN_ANDROID_BUILD_COMMAND

# Output: ./android/app/build/outputs/apk/release/app-release.apk
