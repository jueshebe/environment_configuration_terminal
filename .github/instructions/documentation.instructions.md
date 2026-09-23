---
description: Use when creating or updating project documentation, tool READMEs, or the general project README
applyTo: '**/*.md'
---

<!-- Tip: Use /create-instructions in chat to generate content with agent assistance -->

Provide project context and coding guidelines that AI should follow when generating code, answering questions, or reviewing changes.

## Documentation guidelines

- All project documentation must be written in English.
- Every configured tool must have its own directory and a dedicated `README.md` inside that directory. For example, Kitty must be documented in `kitty/README.md` alongside its configuration files.
- The general project `README.md` must reference every configured tool and include a link to that tool's dedicated `README.md`.
