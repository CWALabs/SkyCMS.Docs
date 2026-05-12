---
canonical_title: Layouts and Templates
description: Manage layouts and templates in SkyCMS — the structural building blocks that determine how every page looks and renders.
doc_type: How-to
product_area: site-structure
user_intent: create-and-manage-layouts-and-templates
audience:
  - Content Managers
  - Site Builders
  - Administrators
difficulty: intermediate
version: current
status: active
owner: docs-platform
last_reviewed: 2026-05-01
---

# Layouts and Templates

**Layouts** and **Templates** are the structural building blocks of SkyCMS. They control the outer shell and the inner content structure of every page on your site. Understanding how they work together is key to managing any SkyCMS site.

!!! tip "New to SkyCMS?"
    If you are unfamiliar with the underlying concepts, read the [For Site Builders guide](../for-site-builders/index.md) first, then return here for the admin how-to steps.

## Layouts vs. Templates — What Each One Does

| | Layout | Template |
| --- | --- | --- |
| **What it controls** | Outer page shell: header, footer, navigation, global CSS/JS | Inner content region: page structure, widget zones |
| **Applies to** | All pages that use this layout | All articles using this template |
| **Who typically edits it** | Site builder or administrator | Site builder or content manager |
| **Edited with** | Page Builder or Code Editor | Page Builder or Code Editor |

A layout wraps a template. A template wraps an article. When a visitor views a page, SkyCMS renders: layout shell → template structure → article content.

For the full conceptual explanation, see [Layouts, Templates & Articles](../for-developers/layouts-templates-articles.md).

## Managing Layouts

### View all layouts

Go to **Editor → Layouts** (top navigation or sidebar). The list shows all layouts defined for this tenant with their names and last-updated dates.

### Create a layout

1. Click **New Layout**.
2. Enter a name for the layout.
3. Click **Create**.
4. The layout opens in the Code Editor (empty). Build the outer shell HTML there, or switch to Page Builder for visual editing.

### Edit a layout

- Click **Page Builder** to edit the layout visually with drag-and-drop components.
- Click **Code Editor** to edit raw HTML, CSS, and template tokens directly.
- Click **Community Layouts** to browse and import pre-built layout starter templates.

### Delete a layout

1. Find the layout in the list.
2. Open the **More** menu → **Delete**.
3. Confirm deletion.

!!! warning
    Deleting a layout affects every page that uses it. Confirm the layout is not in use, or reassign pages first.

## Managing Templates

### View all templates

Go to **Editor → Templates** (top navigation or sidebar). The list shows all templates, their assigned layout, and last-updated dates.

### Create a template

1. Click **New Template**.
2. Enter a name and choose the layout it will use.
3. Click **Create**.
4. Edit the template structure in Page Builder or Code Editor.

### Edit a template

- Click **Page Builder** to edit the template visually.
- Click **Code Editor** to edit the raw template markup.
- Click **Pages** to see which articles currently use this template.
- Click **Preview Impact** to check how changes will affect those pages before saving.

### Publish a template

After editing, click **Publish** on the template to push changes live. All articles using this template will reflect the new structure on their next publish.

### Delete a template

1. Check the **Pages** list to see which articles use this template.
2. Reassign articles to another template, or confirm they can be retired.
3. Delete the template from the **More** menu.

## Common Tasks

### Change which layout a template uses

1. Open the template.
2. Select **Edit** to open template settings.
3. Choose a different layout from the layout dropdown.
4. Save.

### See all pages using a template

1. Open the template.
2. Click **Pages**.
3. The list shows every article currently assigned to this template.

### Preview what a template change will look like

1. Open the template.
2. Click **Preview Impact** before saving.
3. Review the simulated output.
4. Proceed with saving if the result is correct.

## Related Guides

- [For Site Builders: Layouts](../for-site-builders/layouts.md) — conceptual overview and examples
- [For Site Builders: Templates](../for-site-builders/templates.md) — conceptual overview and examples
- [Page Builder](feature-catalog/page-builder.md) — how to use the drag-and-drop editor
- [Code Editor](feature-catalog/code-editor.md) — how to use the code editor
- [Layouts, Templates & Articles (developer deep dive)](../for-developers/layouts-templates-articles.md)
