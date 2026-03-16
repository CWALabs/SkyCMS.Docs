<!-- Audience: Designers and Front-End Developers -->
<!-- Type: Explanation -->
<!-- Status: Draft -->
<!-- Source: SkyCMS/Docs/Developer-Guides/README.md -->

# Site Builder Guide Overview

This guide helps site builders create and maintain reusable site presentation layers for SkyCMS.

## When to use this page

Use this guide when you need to:

- plan the site builder workflow end-to-end,
- validate design-system and page-composition quality gates,
- coordinate handoff between editor and developer roles.

## Build workflow

1. Define the layout direction and constraints.
2. Build or update the layout shell.
3. Build templates that run inside that layout.
4. Validate pages against responsive and accessibility expectations.
5. Handoff guidelines to editors and developers.

## Reusable design strategy

- Keep global structure and theme decisions in layouts.
- Keep repeatable content composition in templates.
- Keep one-off authored content at the page level.
- Prefer tokens and naming conventions over hardcoded values.

## Quality gates

Validate before rollout:

- Responsive behavior across mobile, tablet, and desktop.
- Accessibility landmarks, keyboard flow, and contrast.
- Performance impact of global assets.
- Compatibility with article, blog stream, and blog post pages.

## Handoff expectations

Document and share:

- Layout intent and supported template pairings.
- Known constraints and fallback behavior.
- Example screenshots and validation notes.

## Related guides

- [Layouts](./layouts.md)
- [Templates](./templates.md)
- [Pages](./pages.md)
- [Widgets](./widgets/overview.md)
- [Phased website launch workflow (developer-led)](../for-developers/website-launch/index.md)
