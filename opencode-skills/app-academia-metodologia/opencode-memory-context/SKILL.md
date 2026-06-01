---
name: opencode-memory-context
description: Preserve and reuse durable opencode project memory. Use when a task needs cross-session context, decisions, constraints, implementation notes, recurring project facts, handoff notes, or a compact memory log inspired by claude-mem.
---

# opencode Memory Context

Use this skill to keep a lightweight, auditable memory layer for a project across opencode sessions.

## Workflow

1. Look for existing project memory in `AGENTS.md`, `.agents/`, `memory/`, `docs/`, or handoff files before creating new notes.
2. Capture only durable facts: decisions, constraints, validated commands, environment quirks, unresolved blockers, and next actions.
3. Keep memory short. Prefer bullets with dates and source paths over long narrative.
4. Separate observed facts from inferences. Mark assumptions explicitly.
5. When finishing work, update or create a memory file if the new information will matter in a later session.

## Memory Format

```markdown
---
name: <slug>
description: <one-line summary for relevance matching>
metadata:
  type: project|user|feedback|reference
---

## Facts
- YYYY-MM-DD: Fact, with path or command that proves it.

## Decisions
- YYYY-MM-DD: Decision, reason, owner if known.

## Validated Commands
- `command`: what it validates, last successful date.

## Open Items
- Status, blocker, next best action.
```

## opencode-Specific Paths

| Purpose | Path |
|---------|------|
| Project instructions | `AGENTS.md` or `CLAUDE.md` |
| Skills | `.agents/skills/` |
| Session memory | `.agents/memory/` |

## Guardrails

- Do not store secrets, tokens, passwords, private keys, or personal data in any memory file.
- Do not treat memory as truth when current code or files disagree — verify before acting.
- Prefer updating an existing memory file over scattering notes.
- If a memory item came from an upstream repo, include repo name and license attribution.

## Source

Adapted from: https://github.com/thedotmack/claude-mem (upstream)
License: Apache-2.0
