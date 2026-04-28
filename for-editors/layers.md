---
canonical_title: Layers Panel
description: Use the Layers panel in SkyCMS Page Builder to inspect, select, and reorder nested elements without editing raw markup.
doc_type: How-to
product_area: editing
user_intent: manage-nested-elements-in-page-builder
audience:
  - Content Editors
  - Site Builders
difficulty: beginner
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-28
---

# Layers Panel

## Summary

Use this guide when you need to:

- understand how a page-builder composition is nested,
- select elements that are difficult to click directly on the canvas,
- reorder sections or components safely,
- spot accidental wrapper or nesting problems.

The **Layers panel** in SkyCMS Page Builder shows the nested structure of the elements on the current canvas.

## What the Layers panel is

The Layers panel is a tree view of the current visual composition. Use it to:

- select a section, container, column, or component,
- expand and collapse nested groups,
- verify that content sits inside the expected parent,
- move an item higher or lower in the hierarchy.

## What the Layers panel is not

The Layers panel is often confused with other SkyCMS concepts.

- It is **not** the same thing as the content-model layers of layout, template, article, and published page.
- It is **not** the same thing as caching or delivery layers in infrastructure docs.
- It is **not** a list of templates or reusable site-wide layout definitions.

If you mean the editor feature, use the term **Layers panel**.

## Typical workflow

1. Open Page Builder.
2. Add or select a section on the canvas.
3. Open the **Layers panel**.
4. Expand nested items until you find the exact element you need.
5. Select the element from the tree.
6. Reorder or inspect structure before saving.

## Best practices

- Keep hierarchy shallow when possible.
- Avoid unnecessary wrapper elements.
- Check the Layers panel after drag-and-drop changes to confirm the final nesting.
- Name or structure sections clearly enough that another editor can understand the tree.
- Use the Layers panel to verify headings, content blocks, and media are grouped intentionally.

## Troubleshooting

- Element hard to click on the canvas: select it from the Layers panel instead.
- Spacing or layout looks wrong: check whether a component was nested inside the wrong parent.
- Reordering causes unexpected layout changes: check for framework-specific container or grid wrappers.
- Page is becoming hard to manage: simplify the hierarchy before adding more content.

## Verification

The Layers panel is working correctly when you can select any nested element from the tree, reorder components without unexpected layout side-effects, and confirm final structure before saving.

## Related guides

- [Page Builder](./page-builder.md)
- [Page Builder Quick Start](./page-builder-quickstart.md)
- [Key Concepts](../getting-started/key-concepts.md)
- [Templates](../for-site-builders/templates.md)
