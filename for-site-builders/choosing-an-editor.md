---
canonical_title: Choosing an Editor
description: Decide when to use the Visual Editor (CKEditor) versus the Page Builder (GrapesJS) for a given page or template in SkyCMS.
doc_type: Explanation
product_area: site-building
user_intent: choose-between-visual-editor-and-page-builder
audience:
  - Site Builders
  - Developers
difficulty: beginner
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-29
---

# Choosing an Editor

## Summary

SkyCMS provides two primary visual editing tools: the **Visual Editor** (CKEditor 5) and the **Page Builder** (GrapesJS). Both produce web page content, but they serve fundamentally different purposes. This guide helps site builders and developers decide which tool to use — and how to design for it — before the first editor ever opens the page.

## The Core Difference

The most useful way to think about this is not "which editor is more powerful," but rather: **what is being authored — structure, or content?**

| | Visual Editor (CKEditor) | Page Builder (GrapesJS) |
|---|---|---|
| **What it authors** | Content inside a predefined structure | Structure itself |
| **Who defines the layout** | Site builder / developer (in the template) | The editor, at authoring time |
| **Number of editable regions** | Typically few — one to a handful | Potentially many, determined at edit time |
| **Template rollout** | Changes to the template propagate to all pages using it | Pages are freeform; no template-driven rollout |
| **Maintenance model** | Centralized via templates | Per-page |

### Visual Editor: content inside structure

In the Visual Editor, the template is the design. The developer or site builder defines the structure once — how many regions exist, where they are, and what toolbar each one gets. Editors then fill in those regions without being able to add, remove, or reorder them.

This is the right choice when the page layout should be consistent and controlled. The editor writes; the structure doesn't change.

### Page Builder: structure as the authoring act

In the Page Builder, the editor decides structure — dragging in blocks, reordering sections, adding or removing components. The developer provides a starting library of blocks and a base layout shell, but the composition of each page is up to the editor at the time of authoring.

This is the right choice when pages need to be individually composed or when the number and arrangement of content pieces genuinely varies per page.

---

## When to Use the Visual Editor

Use the Visual Editor (CKEditor) as your authoring model when:

- **The page structure is consistent across many pages.** News articles, blog posts, product updates, and similar content series benefit from a template that enforces the same structure for every page. The editor focuses on writing, not layout.
- **There are a small number of large editable regions.** A page with a title region, a body region, and perhaps a sidebar or call-to-action region is a natural fit for CKEditor. Each region can hold as much rich content as needed.
- **You want template rollout to work.** If you expect to update a template later and have those updates apply across all pages using it, those pages must use CKEditor-managed editable regions with stable `data-ccms-ceid` values.
- **Editors should not be able to alter the page layout.** When brand consistency, accessibility, or editorial standards require a fixed structure, the Visual Editor enforces it by design — editors can only edit within the regions you define.

---

## When to Use the Page Builder

Use the Page Builder (GrapesJS) as your authoring model when:

- **The structure itself is the authoring decision.** Landing pages, promotional pages, and one-off campaign pages often need different layouts each time. The editor is not just writing — they are composing the page.
- **The number of content blocks is variable.** If a page needs "as many cards as this editor decides," and that number differs per page, the Page Builder is the natural fit. Each block is dragged in independently.
- **Pages are largely one-off and do not share a repeatable format.** When there is no meaningful template to reuse, the Page Builder's per-page authoring model is not a liability.
- **A designer or editor wants visual, style-level control.** The Page Builder exposes spacing, typography, color, and responsive breakpoints through a visual style manager. The Visual Editor does not.

---

## The Card Scenario in Depth

Cards — repeated content units common in Bootstrap, Tailwind, and similar CSS frameworks — are one of the clearest cases where the choice matters. There are three valid approaches.

### Option 1: Page Builder (variable card count, editor-driven)

If the editor decides how many cards appear on a given page, the Page Builder is the straightforward choice. The editor drags in one card block per card needed.

**Tradeoff:** Each page is independently structured. Template updates will not propagate. Visual consistency depends on editors using the same block type rather than on enforced structure.

### Option 2: Template with fixed per-card editable regions (known card count)

If the number of cards is always the same — for example, a "three pillars" section that every page in a series has — define the card layout once in the template with a dedicated editable region per card.

```html
<!-- Template: three fixed cards -->
<div class="card-grid">
  <div class="card">
    <h3 data-ccms-ceid="card-1-title" data-editor-config="title">Card 1</h3>
    <div data-ccms-ceid="card-1-body" class="ck-content"><p>Body text.</p></div>
  </div>
  <div class="card">
    <h3 data-ccms-ceid="card-2-title" data-editor-config="title">Card 2</h3>
    <div data-ccms-ceid="card-2-body" class="ck-content"><p>Body text.</p></div>
  </div>
  <div class="card">
    <h3 data-ccms-ceid="card-3-title" data-editor-config="title">Card 3</h3>
    <div data-ccms-ceid="card-3-body" class="ck-content"><p>Body text.</p></div>
  </div>
</div>
```

Editors use the Visual Editor to fill in each card. The layout is defined and maintained by the template.

**Tradeoff:** Adding or removing cards requires a template update, not an editing session. This is intentional — it keeps structure under developer or site builder control.

### Option 3: Duplicator pattern (variable card count, CKEditor-managed)

When the card count varies but you still want CKEditor-managed regions and template rollout benefits, the Duplicator pattern lets editors clone a repeatable block at authoring time.

Each clone gets its own set of editable regions with auto-assigned IDs. The card structure itself is defined in the template; the editor only decides how many to add.

See [Creating Editable Areas — Duplicator Pattern](../for-developers/website-launch/CreatingEditableAreas.md#duplicator-pattern-reusable-blocks) for implementation details.

**Tradeoff:** Requires the Duplicator script to be initialized in the template. Slightly more setup than the Page Builder approach, but content is saved in structured editable regions rather than freeform GrapesJS HTML.

---

## Maintenance Tradeoffs

This is worth understanding before committing to an approach for a content type.

**Visual Editor + templates:** The template is the source of truth for structure. Update the template, and SkyCMS can propagate that update to every article using it. Editable region content is preserved by stable `data-ccms-ceid` IDs. New regions start empty on existing pages; removed regions orphan their content. This model scales well for content sites with many similar pages.

**Page Builder:** Each page's structure is baked into that page's saved HTML. There is no structural template to update. If you want to change the layout of 50 cards-based landing pages, each one must be edited individually in the Page Builder.

For content types that will grow to many pages, the Visual Editor + template model typically reduces long-term maintenance cost significantly.

---

## Quick Decision Reference

```
Is the page structure consistent across many pages?
  Yes → Visual Editor + template

Does the editor decide the structure at authoring time?
  Yes → Page Builder

Are there a variable number of cards/blocks per page?
  Fixed count → Template with per-card regions (Visual Editor)
  Variable count, editor-controlled → Page Builder
  Variable count, developer-controlled pattern → Duplicator + Visual Editor

Will template rollout to existing pages matter?
  Yes → Visual Editor (requires stable data-ccms-ceid regions)
  No → Either tool
```

---

## See Also

- [Visual Editor](../for-editors/visual-editor.md)
- [Page Builder](../for-editors/page-builder.md)
- [Templates](./templates.md)
- [Creating Editable Areas](../for-developers/website-launch/CreatingEditableAreas.md)
