---
canonical_title: Layout Examples
description: Compare framework-based SkyCMS layout examples and choose a layout approach that fits your team and design constraints.
doc_type: Explanation
product_area: site-building
user_intent: compare-layout-framework-examples
audience:
	- Site Builders
	- Designers
	- Front-End Developers
difficulty: intermediate
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# Layout Examples

## Summary

Example SkyCMS layout implementations using Bootstrap 5, Tailwind CSS, Bulma, Foundation, and a no-framework approach.

These examples are intentionally focused on **server-rendered page layouts**, not single-page application shells. Each example shows how to structure a layout with:

- shared head includes,
- a reusable header and navigation area,
- a main content region,
- a footer,
- lightweight framework-specific styling choices.

## When to use these examples

Use these pages when you want to:

- compare framework approaches before choosing one,
- bootstrap a new layout with a familiar CSS system,
- see how layout responsibilities map into real markup,
- adapt a framework-based design into SkyCMS without committing to SPA architecture.

## Outcome

After completing this guide, you should be able to choose a layout example that matches your framework preferences and implementation constraints.

## Included examples

- [No Framework](./no-framework.md): a minimal semantic layout using plain HTML and custom CSS variables, useful as a clean baseline.
- [Bootstrap 5](./bootstrap-5.md): component-friendly, grid-based, strong documentation, good for teams that want predictable UI primitives.
- [Tailwind CSS](./tailwind.md): utility-first, highly customizable, good for design-system-driven teams.
- [Bulma](./bulma.md): lightweight, class-based, approachable for teams that want readable HTML with minimal setup.
- [Foundation](./foundation.md): enterprise-oriented responsive framework with strong layout primitives and accessibility-minded patterns.

## Choosing the right example

Use **No Framework** when you want a lightweight custom foundation, already have an internal design system, or want full control without third-party conventions.

Use **Bootstrap 5** when you want a broad component library and familiar patterns.

Use **Tailwind CSS** when you want tighter control over tokens, spacing, and composition.

Use **Bulma** when you want a simpler class-based layout approach without heavy JavaScript assumptions.

Use **Foundation** when you want a mature responsive framework with strong grid and structural utilities.

## Framework-neutral reminders

No matter which framework you choose, SkyCMS layouts should still:

- keep shared site structure in the layout,
- keep reusable content patterns in templates,
- avoid page-specific content in the layout shell,
- preserve semantic landmarks and accessibility,
- keep framework dependencies as light as practical.

## Related guides

- [Layouts](../layouts.md)
- [Templates](../templates.md)
- [Pages](../pages.md)
- [Layouts (Developers)](../../for-developers/layouts.md)

## Verification

This page is successful when you can pick one framework path confidently and identify the matching layout example to start implementation.
