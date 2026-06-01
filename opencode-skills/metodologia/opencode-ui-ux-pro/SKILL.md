---
name: opencode-ui-ux-pro
description: Apply product-grade UI and UX design heuristics in opencode. Use for frontend apps, dashboards, landing pages, design systems, visual QA, accessibility, interaction polish, responsive layouts, or adapting UI UX Pro Max ideas.
---

# opencode UI UX Pro

Use this skill to make frontend work feel intentional, usable, and visually credible.

## Product Fit

1. Identify the product type: dashboard, SaaS, e-commerce, portfolio, tool, game, internal app, or landing page.
2. Match density and tone to the user: operational tools should be quiet and scannable; consumer pages can be more expressive.
3. Design the actual usable first screen, not a marketing shell — unless a landing page was explicitly requested.

## Design Checks

- Use clear hierarchy, spacing, and contrast.
- Avoid one-note palettes and generic purple/blue gradients unless the brand requires them.
- Prefer familiar controls: icons for tools, toggles for binary options, sliders or inputs for numeric values, tabs for content views.
- Keep text inside containers at both mobile and desktop widths.
- Make repeated items (cards, rows, list items) visually consistent and compact.
- Empty states, loading states, error states, and success states all need a design — not just the happy path.

## Accessibility

- Color contrast ratio >= 4.5:1 for normal text, >= 3:1 for large text (WCAG AA).
- All interactive elements reachable by keyboard with visible focus.
- Form inputs have associated labels.
- Images have meaningful `alt` text.
- Don't rely on color alone to convey information.

## Validation

- Run the app when possible — `npm run dev`, `./gradlew deployAddon`, etc.
- Use browser screenshots for visual QA.
- Check empty, loading, error, and success states explicitly.
- Verify keyboard focus order and responsive behavior at 375px, 768px, 1280px.

## opencode Workflow

1. Start dev server before reporting visual work as complete.
2. Report: what was changed, what was tested, what needs designer sign-off.

## Source

Adapted from: https://github.com/nextlevelbuilder/ui-ux-pro-max-skill (upstream)
License: MIT
