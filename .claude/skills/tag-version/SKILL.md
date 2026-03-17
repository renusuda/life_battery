---
name: tag-version
description: Create a git tag from the current version in pubspec.yaml. Format: v{MAJOR}.{MINOR}.{PATCH}.
---

# Tag Version

Create a git tag based on the current version in `pubspec.yaml`.

## Instructions

1. Read `pubspec.yaml` and extract the current `version` line (e.g. `version: 3.3.0+38`).
2. Parse the version to extract MAJOR, MINOR, and PATCH (ignore build number).
3. Construct the tag name: `v{MAJOR}.{MINOR}.{PATCH}` (e.g. `v3.3.0`).
4. Check if the tag already exists (`git tag --list`). If it does, inform the user and stop.
5. Create the tag: `git tag {tag_name}`.
6. Display the created tag name.
7. Do NOT push the tag automatically. Inform the user they can push with `git push origin {tag_name}`.
