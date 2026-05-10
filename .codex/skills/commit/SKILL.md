---
name: commit
description: Use this skill when creating a git commit.
metadata:
  short-description: Use this skill when creating a git commit.
---

# Git Commit

- Conventional commits: `feat:`, `fix:`, `refactor:`, `docs:`, `test:`, `chore:`, `ci:`
- Keep commit messages concise (1-2 sentences)
- If there are no obvious issues, create the commit without asking the user for confirmation.
- If pre-commit fails, do not proceed with the commit: fix the issue when clear, otherwise report it to
  the user.
