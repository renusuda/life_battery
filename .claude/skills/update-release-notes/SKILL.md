---
name: update-release-notes
description: Update release_notes.json for the new version.
---

# Update Release Notes

Update `release_notes.json` in the project root based on `feat:` and `fix:` commits after the previous git tag.

## Instructions

1. Get the previous tag with `git tag --list 'v*' --sort=-v:refname | head -n 1`.
2. Read commit subjects with `git log {previous_tag}..HEAD --pretty=format:%s`.
3. Keep only commit subjects that start with `feat:` or `fix:`.
   - Ignore `chore:`, `refactor:`, `docs:`, `test:`, and `ci:`.
4. Convert the selected commits into user-facing release note bullets.
   - Do not copy conventional commit prefixes into the final text.
   - Merge or simplify closely related commits when that produces clearer release notes.
   - Keep the notes focused on user-visible changes and bug fixes.
5. Create localized text values:
   - Use one bullet per line prefixed with `・`.
   - Ensure each line ends with a period.
6. Overwrite `release_notes.json` with this exact top-level structure:

```json
[
  {
    "language": "en-US",
    "text": "..."
  },
  {
    "language": "ja",
    "text": "..."
  }
]
```

7. Show the generated English and Japanese release notes to the user after updating the file.
