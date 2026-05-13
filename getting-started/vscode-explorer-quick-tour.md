---
canonical_title: VS Code Explorer Quick Tour
description: Quick visual tour of the SkyCMS VS Code Explorer workflow and when to use it alongside CKEditor.
doc_type: How-to
product_area: getting-started
user_intent: understand-vscode-explorer-workflow-fast
audience:
  - Evaluators
  - Developers
  - Site Builders
difficulty: beginner
version: current
status: active
owner: docs-platform
last_reviewed: 2026-05-13
---

# VS Code Explorer Quick Tour

## Summary

This page gives a fast, visual introduction to the SkyCMS Explorer extension inside Visual Studio Code.

Use it when you want to understand what "CMS as code" looks like in practice before reading deeper setup documentation.

> **What's new in 12.4.0:** SkyCMS VS Code Explorer is now a first-class workflow choice in the SkyCMS toolset, complementing CKEditor, Page Builder (GrapesJS), Monaco, Filerobot, elFinder, and built-in AI. Install from the [Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=cwalabs.skycms-explorer) and review the [Changelog](../reference/changelog.md).

## Where this fits in your team workflow

Use VS Code Explorer when:

- developers need IDE-first control of SkyCMS-managed resources,
- teams want source-control friendly workflows,
- structure and technical content updates are being made.

Use CKEditor when:

- non-technical content creators are performing routine page and blog updates,
- the task is writing and formatting content rather than structural implementation.

Most teams use both.

In mature teams, this becomes a hybrid model: visual teams keep velocity in browser tools while technical teams use VS Code for structure, content-as-code, and file workflows.

## Quick tour steps

### 1. Connect a SkyCMS site

Add the site profile and sign in from VS Code commands.

### 2. Open the SkyCMS tree

Browse layouts, templates, articles, and files from the Explorer panel.

### 3. Edit fields and files

Open CMS content fields and site files in editor tabs, save like normal VS Code documents.

### 4. Preview and publish

Use context actions for preview, publish, and unpublish where supported.

## Visual reference

When your screenshot is ready, place it here:

- `getting-started/img/vscode-explorer-quick-tour.png`

Then this page will render it automatically:

![SkyCMS VS Code Explorer quick tour screenshot](img/vscode-explorer-quick-tour.png)

## What to look for in the screenshot

- SkyCMS Explorer panel with a connected site.
- Category nodes such as Layouts, Page Templates, Articles, and Files.
- An open field/file tab in the VS Code editor area.
- Context menu actions or command palette entries for SkyCMS tasks.

## Related guides

- [SkyCMS VS Code Extension](../for-developers/extending/vscode-extension.md)
- [Why SkyCMS Is Different](./why-skycms-is-different.md)
- [What Is SkyCMS?](./what-is-skycms.md)
