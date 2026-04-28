---
canonical_title: Visual Editor Visual Guide
description: Learn what the SkyCMS Visual Editor interface looks like and how to recognize its main zones, modes, and visual states.
doc_type: Reference
product_area: editing
user_intent: understand-the-visual-editor-interface-before-editing
audience:
   - Content Editors
difficulty: beginner
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# Visual Editor Visual Guide

## Summary

Use this guide to recognize the main parts of the Visual Editor before you start editing or when you need to explain the interface to other editors.

## Open and Navigate the Editor

### From the page you want to edit

The quickest way to open the Visual Editor is directly from the page itself:

1. Navigate to the page on the website while logged in.
2. The SkyCMS navigation bar appears at the top of the page.
3. Click **Edit** in the navigation bar. A dropdown loads with the available editors for that page.
4. Click **Visual Editor** to open the Visual Editor.

> **Note:** **Visual Editor** only appears in the dropdown if the page template has rich-text editing enabled. If you see only **Page Builder** and **Code Editor**, the Visual Editor is not available for that page. Contact your site administrator if you need it enabled.

### From the Pages list

You can also reach the Visual Editor through the content management menu:

1. In the SkyCMS navigation bar, click **Menu** and choose **Pages**.
2. Locate the page you want to edit and open it.
3. Click **Versions** to open the version history for that page.
4. In the button group at the top of the Versions page, click **Visual Editor**.
   - If the button is greyed out and disabled, the Visual Editor is not enabled for that page template.

### Role access

- **Administrators** and **Editors** can access all editor types.
- **Authors** can access the Visual Editor where it is enabled.
- **Reviewers** do not have access to any editor — the **Edit** dropdown is not shown for reviewer accounts.

## Outcome

After reading this guide, you should be able to open the Visual Editor through the right entry point and identify the main editing zones and states.

## Main Zones

- Top toolbar: formatting, insert, and publish actions.
- Content canvas: editable page content in context.
- Inline (selection) toolbar: quick text actions.
- Block toolbar: block-level insert actions.

## Editor Modes You May See

- Title mode: focused title/heading editing with minimal controls.
- Simple mode: lightweight formatting for straightforward edits.
- Standard mode: default Visual Editor layout for most regions.
- Advanced mode: expanded controls for richer formatting and layout tasks.

## Visual States

- Hover state: editable regions become identifiable.
- Active state: selected region is clearly highlighted.
- Locked state: region indicates another user is currently editing.

## Common UI Elements

- Link tools: one `Insert link` dropdown with internal page and external website options.
- Image tools: one image dropdown with computer upload, website storage, and external URL options.
- Media tools: video/embed options where enabled.
- Table tools: insert/edit table structures.
- Save indicators: success/error toast notifications.

## Practical Use

- Use region highlight cues to avoid editing the wrong section.
- Use block tools for structure and inline tools for text refinement.
- Confirm save status before closing editor.

## Verification

This guide has served its purpose when you can locate the Visual Editor, recognize the current mode, and distinguish the toolbar, content canvas, inline tools, and block tools during an editing session.

## Related Docs

- [Visual Editor](./visual-editor.md)
- [Visual Editor Technical Reference](./visual-editor-technical-reference.md)
- [Visual Editor Toolbar Reference](./visual-editor-toolbar-reference.md)
