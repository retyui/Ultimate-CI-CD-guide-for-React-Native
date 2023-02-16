# Ultimate-CI-CD-guide-for-React-Native


- State of React Native CI/CD: https://results.stateofreactnative.com/deployment/

## TODO

- [x] Android
- [x] iOS
- [x] Apple signing
- [ ] Android keystore
- [ ] Prod, Staging environments
- [ ] CodePush (codesign, beta & prod releases)
- [ ] Source maps
- [ ] E2E tests (detox, maestro, appium)
- [ ] Fastlane (signing, deploy, deviceIds, etc)
- [ ] AppGallery
- [ ] BrowserStack
- [ ] Sauce Labs
- [ ] Try all CI/CD services (buildjet, github, nitro.build, appcener, etc)
- [ ] Collect duration for RN project with lots of native deps.

## Project info

- React Native `0.71.x`
- Android target SDK `33` (Android 13)
- Min iOS `12.4`



## [GitHub Actions](https://github.com/features/actions)

Configs:
 - Android
   - Fastlane: [`.github/workflows/android-fastlane.yaml`](.github/workflows/github-non-prod-android-fastlane.yml), [`fastlane/Fastfile`](fastlane/Fastfile)
   - Bash Scripts: [`.github/workflows/android.yaml`](.github/workflows/github-non-prod-android-bash.yml), [`scripts/make-android-build.sh`](scripts/make-android-build.sh)
 - iOS
   - Open-source github action [`yukiarrr/ios-build-action`](https://github.com/yukiarrr/ios-build-action): [`.github/workflows/ios-github-action.yml`](.github/workflows/github-non-prod-ios-github-action.yml)


| * | iOS | Android (Github runner) | Android ([BuildJet runner](https://buildjet.com/for-github-actions/pricing)) |
|---|---|---|---|
| Status | [![iOS Non-Prod Github & yukiarrr/ios-build-action](https://github.com/retyui/Ultimate-CI-CD-guide-for-React-Native/actions/workflows/github-non-prod-ios-github-action.yml/badge.svg)](https://github.com/retyui/Ultimate-CI-CD-guide-for-React-Native/actions/workflows/github-non-prod-ios-github-action.yml) | [![Android Non-Prod Github & Fastlane](https://github.com/retyui/Ultimate-CI-CD-guide-for-React-Native/actions/workflows/github-non-prod-android-fastlane.yml/badge.svg)](https://github.com/retyui/Ultimate-CI-CD-guide-for-React-Native/actions/workflows/github-non-prod-android-fastlane.yml) | [![Android Non-Prod (Github vs BuildJet) & Bash](https://github.com/retyui/Ultimate-CI-CD-guide-for-React-Native/actions/workflows/github-non-prod-android-bash.yml/badge.svg)](https://github.com/retyui/Ultimate-CI-CD-guide-for-React-Native/actions/workflows/github-non-prod-android-bash.yml) |
| Duration (no cache) | 23 min 28 sec |  3 min 4 sec | 4 min 3 sec |
| Duration (cache) | 18m 57s |  2 min 0 sec | 2 min 55 sec |
| OS | macOS 12.6.3 | Ubuntu 20.04.5 LTS | Ubuntu 22.04.1 LTS |
| CPU | (3) x64 Intel(R) Xeon(R) CPU E5-1650 v2 @ 3.50GHz | (2) x64 Intel Xeon Platinum 8272CL CPU @ 2.60GHz | (4) x64 AMD Ryzen 9 5950X |
| Memory | 14.00 GB | 6.78 GB | 13.73 GB |


## [Nitro Build](https://nitro.build/) 🚀

<details>
  <summary>Dashboard</summary>

  ![image](https://user-images.githubusercontent.com/4661784/218336341-1c006e4c-94d5-44d7-bab6-e8bfa1e13d65.png)

  ![image](https://user-images.githubusercontent.com/4661784/218336467-8b27d3a1-03e0-4f52-a9a2-e10026c64066.png)
</details>

Configs:
- iOS: [`.github/workflows/nitro-ios.yml`](.github/workflows/nitro-non-prod-ios.yml)
- Android [`.github/workflows/nitro-android.yml`](.github/workflows/nitro-non-prod-android.yml)

| * | iOS | Android |
|---|---|---|
| Status | [![iOS Not-Prod nitro.build](https://github.com/retyui/Ultimate-CI-CD-guide-for-React-Native/actions/workflows/nitro-non-prod-ios.yml/badge.svg)](https://github.com/retyui/Ultimate-CI-CD-guide-for-React-Native/actions/workflows/nitro-non-prod-ios.yml) | [![Android Not-Prod nitro.build](https://github.com/retyui/Ultimate-CI-CD-guide-for-React-Native/actions/workflows/nitro-non-prod-android.yml/badge.svg)](https://github.com/retyui/Ultimate-CI-CD-guide-for-React-Native/actions/workflows/nitro-non-prod-android.yml) |
| Duration (no cache) | 24 min 23 sec | 4 min 48 sec |
| Duration (cache) |  1 min 30 sec | 0 min 41 sec |


## [Codemagic](https://reactnativeci.com/) 🚀

Configs:
- iOS + Android: [`codemagic.yaml`](codemagic.yaml)

| * | iOS | Android |
|---|---|---|
| Status | [![Codemagic build status](https://api.codemagic.io/apps/63ee8817531a3507d903e30e/ios-non-prod/status_badge.svg)](https://codemagic.io/apps/63ee8817531a3507d903e30e/ios-non-prod/latest_build) | [![Codemagic build status](https://api.codemagic.io/apps/63ee8817531a3507d903e30e/android-non-prod/status_badge.svg)](https://codemagic.io/apps/63ee8817531a3507d903e30e/android-non-prod/latest_build) |
| [mac_mini_m1](https://docs.codemagic.io/specs/versions-macos/) (no cache) | 5m 29s | 4m 10s |
| [mac_mini_m1](https://docs.codemagic.io/specs/versions-macos/) (cache) | 4m 5s | 3m 8s |
| OS | macOS 13.0.1 | macOS 13.0.1 |
| CPU | (4) arm64 Apple M1 (Virtual) | (4) arm64 Apple M1 (Virtual) |
| Memory | 8GB | 8GB |


## [CircleCI](https://circleci.com/)

Configs:
- Android [`.circleci/config.yml`](.circleci/config.yml)


| * | iOS | Android ([large](https://circleci.com/docs/configuration-reference/#docker-execution-environment)) |
|---|---|---|
| Status |  | [![CircleCI](https://dl.circleci.com/status-badge/img/gh/retyui/Ultimate-CI-CD-guide-for-React-Native/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/retyui/Ultimate-CI-CD-guide-for-React-Native/tree/main) |
| Duration (no cache) |  | 4min 52sec |
| Duration (cache) |  | 3min 12sec |
| OS |  | Ubuntu 22.04.1 LTS |
| CPU |  | (4) vCPU |
| Memory |  | 8GB |


## [Travis-CI](https://www.travis-ci.com/)

TODO...

and others Bitrise,appcircle,Azure DevOps,Bitbucket Pipelines,Buddy,Codemagic,Gitlab CI,Expo EAS Build


## [AppCenter](https://learn.microsoft.com/en-us/appcenter/build/)

<details>
  <summary>Config: web config stored on the service side</summary>

  **Android**
  ![image](https://user-images.githubusercontent.com/4661784/218334902-49470d22-ac89-4a73-8784-7e6f8c4876cc.png)

  **iOS**

  ![image](https://user-images.githubusercontent.com/4661784/218334866-8e5b569f-186e-4d78-9c30-a5968aad4b78.png)

</details>

**Troubleshooting:**

- Android build fail: `Android Gradle plugin requires Java 11 to run. You are currently using Java 1.8.`
  **Solution**: add an environment variable `JAVA_HOME` with value `$(JAVA_HOME_11_X64)`

| * | iOS | Android |
|---|---|---|
| Status | [![Build status](https://build.appcenter.ms/v0.1/apps/b5f5ebaa-0fe7-4b84-a363-73550a4e5fdc/branches/main/badge)](https://appcenter.ms/orgs/Ultimate-CI-CD-guide-for-React-Native/apps/iOS/build/branches) | [![Build status](https://build.appcenter.ms/v0.1/apps/382ab82e-4117-4e65-b407-40da8dcdbcad/branches/main/badge)](https://appcenter.ms/orgs/Ultimate-CI-CD-guide-for-React-Native/apps/Android/build/branches/main) |
| Duration (no cache) | 23 min 2 sec | 8 min 7 sec |
| Duration (cache) | 24 min 52 sec | 6 min 53 sec |
| OS | macOS 11.7.3 | macOS 11.7.3 |
| CPU | (3) x64 Intel Xeon CPU E5-1650 v2 @ 3.50GHz | (3) x64 Intel Xeon(R) CPU E5-1650 v2 @ 3.50GHz |
| Memory | 14.00 GB | 14.00 GB |
