---
name: opencode-gsd-workflow
description: Run a focused opencode delivery loop inspired by GSD (Get Shit Done). Use for messy tasks, multi-step implementations, repo setup, migrations, and operational work that needs momentum without losing engineering judgment.
---

# opencode GSD Workflow

Use this skill when a request needs decisive execution without analysis paralysis.

## Loop

1. Define the concrete outcome in one sentence before touching any file.
2. Inventory constraints: repo state, external auth, network access, tools available, and user-visible deliverables.
3. Choose the smallest useful implementation that satisfies the request — no over-engineering.
4. Execute in short cycles: inspect, edit, test, document.
5. Keep a running done/blocker list for tasks longer than one context window.
6. Finish with what changed, what was verified, and what remains blocked.

## Decision Rules

- Prefer working software or usable artifacts over theoretical plans.
- Ask only when a missing answer would make the work risky or impossible to reverse.
- When publishing or creating external resources, verify authentication early — not at the end.
- For third-party code, check LICENSE before adapting. Preserve attribution.
- If an upstream repo has moved, note both referenced and current active repo.
- Never use `--no-verify` or bypass hooks unless the user explicitly requests it.

## opencode Specifics

- Use `AGENTS.md` for project constraints that must persist across sessions.
- Prefer `.agents/skills/` for project-level skills and agents.
- Use sub-agents (`task` tool) only for genuinely independent parallel work.
- Commit atomically at each conclusive step — one commit per logical change.
- Follow existing encoding rules in `.editorconfig` and `.gitattributes`.

## Output Format

Report:
- Artifact paths (as relative Markdown links).
- Commands run and validation result.
- Remote URL if publication succeeded.
- Exact blocker if authentication or network failed.

## Source

Adapted from: https://github.com/gsd-build/get-shit-done (upstream)
License: MIT
