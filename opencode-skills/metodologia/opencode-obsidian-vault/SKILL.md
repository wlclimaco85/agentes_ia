---
name: opencode-obsidian-vault
description: Work with Obsidian vaults from opencode. Use when creating or editing Obsidian Markdown, wikilinks, properties, callouts, Bases, JSON Canvas files, vault organization, note templates, or adapting obsidian-skills guidance.
---

# opencode Obsidian Vault

Use this skill for Obsidian-aware writing and file editing inside opencode sessions.

## Markdown Conventions

- Preserve wikilinks `[[Note]]`, embeds `![[Image.png]]`, tags, and YAML frontmatter properties.
- Use Obsidian callouts when they improve scanning:

```markdown
> [!note]
> Short useful content.

> [!warning]
> Action that cannot be undone.

> [!tip]
> Shortcut or best practice.
```

- Keep links relative to the vault root.
- Avoid rewriting the user's personal note style unless asked.

## Frontmatter

Preserve all frontmatter fields, including unknown plugin metadata:

```yaml
---
title: Note Title
date: YYYY-MM-DD
tags: [tag1, tag2]
aliases: [other-name]
---
```

## Bases and Canvas

- For `.base` files: preserve structured filters, formulas, and views. Validate that properties referenced in the Base exist on target notes.
- For `.canvas` files: preserve valid JSON Canvas shape — nodes, edges, ids, positions, and dimensions. Use deterministic ids for generated nodes when possible.

## Vault Safety

- Search before creating notes to avoid duplicates.
- Do not rename files unless explicitly asked — renames break wikilinks.
- Do not delete files unless explicitly asked.
- Prefer updating existing notes over creating new ones for the same topic.
- When moving notes, update all wikilinks pointing to the moved file.

## Templates

When creating a template, use the Templater-compatible format if the vault uses it:

```markdown
---
date: <% tp.date.now("YYYY-MM-DD") %}
---
# <% tp.file.title %>
```

## Source

Adapted from: https://github.com/kepano/obsidian-skills (upstream)
License: MIT
