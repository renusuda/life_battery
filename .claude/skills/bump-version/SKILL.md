---
name: bump-version
description: Bump the app version in pubspec.yaml. Accepts optional argument: major, minor (default), or patch. Build number is always incremented.
user_invocable: true
---

# Bump Version

Bump the version in `pubspec.yaml`. The version format is `MAJOR.MINOR.PATCH+BUILD_NUMBER`.

## Instructions

1. Read `pubspec.yaml` and extract the current `version` line (e.g. `version: 3.2.1+37`).
2. Parse the version into MAJOR, MINOR, PATCH, and BUILD_NUMBER components.
3. Determine the bump type from the argument (default: `minor`):
   - `patch` -> increment PATCH, keep MAJOR and MINOR
   - `minor` -> increment MINOR, reset PATCH to 0, keep MAJOR
   - `major` -> increment MAJOR, reset MINOR and PATCH to 0
4. Always increment BUILD_NUMBER by 1, regardless of bump type.
5. Update the `version` line in `pubspec.yaml` with the new version.
6. Display the version change (e.g. `3.2.1+37 -> 3.3.0+38`).
7. Run `fvm flutter pub get` to verify the change is valid.
