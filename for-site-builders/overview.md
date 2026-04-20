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
4. Use example implementations to validate structural decisions before rollout.
5. Validate pages against responsive and accessibility expectations.
6. Handoff guidelines to editors and developers.

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

## Example libraries

Use the example sections when you want to compare implementation patterns before creating production layouts, templates, or one-off articles.

- [Layout Examples Overview](./layout-examples/overview.md)
- [Template Examples Overview](./template-examples/overview.md)
- [Article Examples Overview](./article-examples/overview.md)

## Related guides

- [Layouts](./layouts.md)
- [Templates](./templates.md)
- [Pages](./pages.md)
- [Layout Examples Overview](./layout-examples/overview.md)
- [Template Examples Overview](./template-examples/overview.md)
- [Article Examples Overview](./article-examples/overview.md)
- [Widgets](./widgets/overview.md)
- [Phased website launch workflow (developer-led)](../for-developers/website-launch/index.md)
