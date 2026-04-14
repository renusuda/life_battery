---
name: create-release
description: Create a GitHub Release from an existing git tag. Uses the latest tag by default, or accepts a tag name as argument.
---

# Create Release

Create a GitHub Release from an existing git tag using `gh release create`.

## Instructions

1. Determine the target tag:
   - If an argument is provided, use it as the tag name.
   - Otherwise, get the latest tag: `git tag --list --sort=-v:refname | head -1`.
2. Verify the tag exists locally (`git tag --list {tag_name}`). If not, inform the user and stop.
3. Check if a GitHub release already exists for this tag (`gh release view {tag_name}`). If it does, inform the user and stop.
4. Get the previous tag to determine the commit range:
   - List tags sorted by version: `git tag --list --sort=-v:refname`
   - Find the tag immediately before the target tag.
5. Read `release_notes.json` in the project root and extract the `text` from the `en-US` entry.
6. Convert the text into bullet points using `- ` prefix, matching the style of existing releases.
7. Show the draft release notes to the user and ask for confirmation before creating.
8. Push the tag to remote if not already pushed: `git push origin {tag_name}`.
9. Create the release: `gh release create {tag_name} --title "{tag_name}" --notes "{notes}"`.
10. Display the release URL to the user.
