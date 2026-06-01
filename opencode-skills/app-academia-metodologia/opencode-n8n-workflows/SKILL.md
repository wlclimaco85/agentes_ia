---
name: opencode-n8n-workflows
description: Design, inspect, validate, and document n8n workflows from opencode with MCP-aware safety guardrails. Use when working with n8n nodes, workflow JSON, automation design, self-hosted n8n, MCP integration, or AI-assisted workflow generation.
---

# opencode n8n Workflows

Use this skill for n8n workflow work inside opencode, especially when using an n8n MCP server for direct API access.

## Safety First

1. Never edit production workflows directly — export, modify, test, then import.
2. Work from exported JSON copies committed to version control.
3. Keep credentials out of files and prompts — use n8n credential store.
4. Validate node names, operations, required properties, and trigger behavior before deploying.
5. Test in a development n8n instance before production.

## Workflow Design

Start with this mental model before touching any node:
1. **Trigger**: what starts the workflow (webhook, cron, event, manual)?
2. **Data shape**: what does the input look like?
3. **Transformations**: how does it need to be reshaped?
4. **External calls**: which APIs, services, or databases are involved?
5. **Error handling**: what happens on failure of each external call?
6. **Final side effect**: what does the workflow write, send, or mutate?

For finance, CRM, messaging, and customer data workflows: always add explicit error branches.

## MCP Integration

When an n8n MCP server is available:

```json
{
  "mcpServers": {
    "n8n": {
      "command": "npx",
      "args": ["-y", "n8n-mcp"],
      "env": { "N8N_HOST": "http://localhost:5678", "N8N_API_KEY": "..." }
    }
  }
}
```

- Use MCP tools to inspect node schemas instead of guessing field names.
- Use MCP tools to list, create, and execute workflows safely.
- Credentials remain in n8n — never pass them through prompts.

## Review Checklist

- [ ] Trigger cannot fire unexpectedly in production.
- [ ] Rate limits and retry logic are intentional, not default.
- [ ] Webhook paths and auth are appropriate for the exposure level.
- [ ] PII handling is documented in workflow notes.
- [ ] Workflow JSON is valid and importable (`n8n import:workflow`).
- [ ] Error outputs are handled, not silently swallowed.

## opencode Workflow

1. Export workflow JSON: `n8n export:workflow --id=<id> --output=workflows/<name>.json`
2. Edit the JSON file.
3. Validate structure (nodes, connections, settings).
4. Import: `n8n import:workflow --input=workflows/<name>.json`
5. Run a test execution and verify the output.

## Source

Adapted from: https://github.com/czlonkowski/n8n-mcp (upstream)
License: MIT
