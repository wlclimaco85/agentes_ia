---
name: opencode-resource-scout
description: Evaluate and adapt ecosystem resources for opencode projects. Use when comparing or converting skills, agents, MCP servers, curated lists (like awesome-claude-code), or agent workflow repositories into usable project-level guidance.
---

# opencode Resource Scout

Use this skill to mine Claude-oriented repositories for ideas without blindly copying incompatible assumptions.

## Evaluation Steps

1. Identify the artifact type: skill, plugin, hook, command, MCP server, curated list, methodology, or example app.
2. Check the LICENSE before adapting. If the license forbids derivatives, keep it as an unchanged reference and write separate original guidance.
3. Separate the reusable concept from harness-specific implementation details.
4. Map resource-specific paths to your project's equivalents:
   - Generic `.claude/commands/` -> your project's `.agents/skills/`
   - Claude hooks -> explicit workflow checks or `AGENTS.md` rules
   - MCP server config -> `.mcp.json` or `opencode.json`
   - Codex skills -> opencode skill format (see `.agents/skills/` in this workspace)
5. Write a concise project-facing note: when to use it, what it is good at, setup needs, and known risks.

## Compatibility Rating

| Rating | Meaning |
|--------|---------|
| **ready** | Works as-is with minor path adjustments |
| **adaptable** | Core concept is valid; implementation needs rewriting |
| **reference-only** | Good ideas; license or platform prevents direct use |
| **not recommended** | Outdated, broken, or incompatible approach |

## Useful Output

- Compatibility rating and rationale.
- Required tools and install commands.
- License and attribution (repo URL + SPDX identifier).
- Project-specific usage instructions after adaptation.

## Curated Sources

- `awesome-claude-code/` — curated list of Claude Code / opencode resources
- `get-shit-done/` — delivery workflow methodology
- `superpowers/` — engineering method
- `claude-mem/` — memory layer pattern
- `obsidian-skills/` — Obsidian-aware writing
- `ui-ux-pro-max-skill/` — UI/UX design heuristics
- `n8n-mcp/` — n8n automation with MCP

## Source

Adapted from: https://github.com/hesreallyhim/awesome-claude-code (upstream)
License: CC BY-NC-ND 4.0 (upstream); this adaptation is original guidance.
