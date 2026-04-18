---
name: bump-version
description: Bump the app version in pubspec.yaml. Accepts optional argument: major, minor (default), or patch. Build number is always set to 1.
---

# Bump Version

Update the version in pubspec.yaml. The format is MAJOR.MINOR.PATCH+1.

## Instructions

1. Read `pubspec.yaml` and extract the current `version` line (e.g. `version: 3.2.1+1`).
2. Parse the version into MAJOR, MINOR, PATCH.
3. Determine the bump type from the argument (default: `minor`):
   - `patch` -> increment PATCH, keep MAJOR and MINOR
   - `minor` -> increment MINOR, reset PATCH to 0, keep MAJOR
   - `major` -> increment MAJOR, reset MINOR and PATCH to 0
4. Update the `version` line in `pubspec.yaml` with the new version.
5. Display the version change (e.g. `3.2.1+1 -> 3.3.0+1`).
6. Run `fvm flutter pub get` to verify the change is valid.
