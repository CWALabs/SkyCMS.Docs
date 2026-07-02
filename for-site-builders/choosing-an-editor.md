---
canonical_title: Choosing an Editor
description: Decide when to use the Visual Editor versus the Code Editor for a given page or template in SkyCMS.
doc_type: Explanation
product_area: site-building
user_intent: choose-between-visual-editor-and-code-editor
audience:
  - Site Builders
  - Developers
difficulty: beginner
version: current
status: active
owner: docs-platform
last_reviewed: 2026-07-01
---

# Choosing an Editor

## Summary

SkyCMS has three editor experiences overall, but this decision guide focuses on the two primary authoring editors:

- Visual Editor for rich, in-context content editing
- Code Editor for structural and markup-level control

Use this guide to choose the right editor for each workflow.

For image-only updates (crop, resize, annotation), use [Image Editor](../for-editors/image-editing.md).

## The Core Difference

The key question is: are you editing content inside a defined structure, or editing the structure itself?

| | Visual Editor | Code Editor |
| --- | --- | --- |
| What it edits | Content inside predefined editable regions | HTML/CSS/script structure and region markup |
| Typical user | Content editor | Site builder or developer |
| Best for | Routine copy, media, and formatting updates | Template/layout changes and precise markup control |
| Rollout impact | Usually page-level content changes | Can impact many pages if template/layout is changed |

## When to Use Visual Editor

Use Visual Editor when:

- editors need low-friction content updates,
- page structure is already defined,
- changes are mainly text, media, links, or tables.

## When to Use Code Editor

Use Code Editor when:

- you need to change layout or template structure,
- you are adding or updating editable regions,
- you need precise control over HTML/CSS/script behavior,
- you want source-control-friendly diffs for technical changes.

## Practical Decision Flow

```text
Are you changing page structure or shared markup?
  Yes -> Code Editor
  No  -> Visual Editor

Are you editing content inside an existing region?
  Yes -> Visual Editor
  No  -> Code Editor
```

## Maintenance Guidance

- Keep structure changes in templates/layouts through Code Editor.
- Keep day-to-day publishing updates in Visual Editor.
- Validate template changes on one representative page before broad rollout.

## See Also

- [Visual Editor](../for-editors/visual-editor.md)
- [Code Editor](../for-editors/code-editor.md)
- [Templates](./templates.md)
- [Layouts](./layouts.md)
