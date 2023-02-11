# Versioning android and ios apps


## Android

We use env variables `RELEASE_VERSION` and `RELEASE_CODE` to set the version name and code (see [`android/app/semver.gradle`](../android/app/semver.gradle))


### Production Releases

```bash
RELEASE_VERSION=1.2.3 # semver
RELEASE_CODE=12345 # number
```

### Beta/Staging (Non-Prod) Releases

```bash
RELEASE_VERSION=1.0.0+<branch_name> # semver
RELEASE_CODE=1 # locked to one to avoid a `INSTALL_FAILED_VERSION_DOWNGRADE` exception
```


### Local developers machine

```bash
RELEASE_VERSION=1.0.0
RELEASE_CODE=1
```
