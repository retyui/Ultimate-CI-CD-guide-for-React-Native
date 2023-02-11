# Speeding up the build


- TODO `NO_MINIFY_JS: 1`
- TODO `reactNativeArchitectures=armeabi-v7a,arm64-v8a,x86,x86_64`


- TODO `ccache`
- TODO `prebuild Pods`

```
# ^^^ For faster build time you can specify only required architecture
#   - "armeabi-v7a,arm64-v8a,x86,x86_64" # Universal apk (affect build time)
#   - "arm64-v8a"                        # For testing on real Android devices (much faster build time)
#   - "x86_64",                          # For e2e testing on emulators (much faster build time)
# Read: https://reactnative.dev/docs/build-speed#build-only-one-abi-during-development-android-only
```
