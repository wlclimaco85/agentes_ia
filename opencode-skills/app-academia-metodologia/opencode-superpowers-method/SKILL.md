---
name: opencode-superpowers-method
description: Apply a spec-first, test-aware opencode engineering method inspired by Superpowers. Use for substantial software changes, architecture decisions, refactors, bugs with uncertain cause, or work that benefits from discovery, plan, implementation, review, and validation phases.
---

# opencode Superpowers Method

Use this skill as a disciplined engineering process inside opencode sessions.

## Method

### 1. Discover
Read the current system before designing a change:
- Relevant files, tests, config, and git log.
- Existing patterns — match them unless replacing them is the goal.
- External dependencies and their current versions.

### 2. Specify
State intended behavior and non-goals in plain language:
- What changes and what must NOT change.
- Acceptance criteria the user can validate.

### 3. Plan
Build a short implementation plan when the work is broad:
- Ordered list of changes: files to create, edit, delete.
- Schema or interface changes noted explicitly.
- Breaking changes flagged upfront.

### 4. Execute
Make scoped edits that follow local patterns:
- One logical change per commit.
- Encoding rules from `.editorconfig` respected always.
- No unrelated cleanup in the same commit.

### 5. Validate
Use the most relevant checks available:
- Run tests, build, lint, or type-check.
- Verify behavior from the user's perspective, not just from code structure.
- For UI: start the dev server and visually check golden paths and edge cases.

### 6. Review
Inspect the full diff before reporting done:
- Regressions in other areas.
- Security vulnerabilities (injection, XSS, exposure).
- Missing attribution for adapted upstream code.

## Testing Posture

- Red/green TDD for complex behavior or easy-to-regress logic.
- For config or docs changes, validate structure and links.
- For frontend changes, visually verify when a local target is available.
- For scripts or automation, run a harmless/dry-run mode first when possible.

## Handoff

End with concise evidence:
- Files changed (relative Markdown links).
- Validation performed.
- Residual risks.
- Next command the user can run — only when useful.

## Source

Adapted from: https://github.com/obra/superpowers (upstream)
License: MIT
