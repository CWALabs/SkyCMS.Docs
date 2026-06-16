---
canonical_title: SkyCMS VS Code Extension
description: Use the SkyCMS VS Code extension to browse and edit SkyCMS content and files from inside Visual Studio Code.
doc_type: How-to
product_area: extensibility
user_intent: use-skycms-vscode-extension
audience:
  - Developers
  - Site Builders
difficulty: intermediate
version: current
status: active
owner: docs-platform
last_reviewed: 2026-05-05
---

# SkyCMS VS Code Extension

## Summary

Use the SkyCMS VS Code extension to connect VS Code to a SkyCMS Editor site, then work with layouts, templates, articles, blogs, and files without leaving your editor.

This extension is central to the SkyCMS "CMS as code" workflow: developers can use familiar IDE practices while still collaborating with content teams who use CKEditor and visual tools.

## Outcome

After this guide, you can:

- connect to one or more SkyCMS sites,
- sign in with browser-based authentication,
- edit SkyCMS fields and files from VS Code,
- publish and preview key content items,
- recover quickly from common setup and auth errors.

## Why this matters for team workflow

SkyCMS is designed so teams do not have to choose between developer freedom and editor simplicity.

- Developers can keep working in a code-first environment with standard IDE patterns.
- Non-technical content creators can continue routine page and blog updates through CKEditor with little or no training.
- Both groups work on the same platform and share the same publishing lifecycle.

In most teams, this creates a clean handoff model: developers and site builders shape structure, then content creators maintain day-to-day content confidently.

## What this extension does today

The extension provides:

- site profile management (add, switch, remove),
- browser sign-in with one-time code exchange,
- a SkyCMS explorer tree (layouts, templates, articles, blogs, files),
- field editing in either document mode or inline input mode,
- article and layout actions (publish, unpublish, set default, duplicate),
- file operations in `/pub` (open, upload, create folder, rename/move, delete),
- preview launch for supported content nodes,
- an in-chat SkyCMS assistant focused on docs discovery.

## Prerequisites

Before you start:

1. Install Visual Studio Code 1.85 or later.
2. Ensure you can reach a running SkyCMS Editor URL.
3. Use an account with a role that can edit content.

## First-run workflow

### 1. Add a SkyCMS site profile

1. Open Command Palette.
2. Run `SkyCMS: Add Site`.
3. Enter your SkyCMS Editor base URL.
4. Optionally enter a friendly site name.

### 2. Sign in

1. Open the SkyCMS view in Explorer.
2. Select **Sign In**.
3. Complete sign-in in your browser.
4. Copy the one-time verification code from SkyCMS.
5. Paste the code into the VS Code prompt.

### 3. Expand the content tree

After sign-in, expand SkyCMS categories:

- Layouts
- Page Templates
- Articles (Drafts and Published)
- Blogs
- Files

## Editing model

SkyCMS fields open in one of two ways:

- Document mode: opens in an editor tab and saves on standard VS Code save.
- Input mode: opens a prompt and saves on Enter.

Common document fields include content/body/head/footer blocks. Common input fields include title/category/date-like values.

## When to use VS Code versus browser editors

Use the VS Code extension when you need:

- IDE-centric exploration of SkyCMS-managed resources,
- code review and source-control friendly editing sessions,
- rapid developer iteration on templates, layout assets, and technical content fields.

Use browser editors when you need:

- fast non-technical authoring in CKEditor,
- visual page composition in Page Builder,
- editorial workflows where contributors are not expected to use developer tooling.

Most teams use both paths together.

## File workflow in VS Code

The extension mounts SkyCMS blob storage through a virtual file system rooted at `/pub`.

For article assets, the extension follows the same dual-path contract as File Manager:

- list views can show friendly article titles,
- operations continue to target canonical paths such as `/pub/articles/{articleNumber}/...`.

This keeps editing UX readable while preserving stable storage paths and URLs.

Typical workflow:

1. Expand **Files**.
2. Open and edit a text file.
3. Save in VS Code to persist directly to SkyCMS storage.
4. Use context menu commands to upload, create folders, or delete nodes.

## Commands quick reference

Site and auth commands:

- `SkyCMS: Add Site`
- `SkyCMS: Switch Site`
- `SkyCMS: Remove Site`
- `SkyCMS: Manage Sites`
- `SkyCMS: Sign In`
- `SkyCMS: Sign Out`

Working commands:

- `SkyCMS: Refresh`
- `SkyCMS: New Article`
- `SkyCMS: Documentation`
- `SkyCMS: Open in Browser`
- `SkyCMS: Ask SkyCMS`

Most publish/preview/file commands are available from right-click context menus in the SkyCMS tree.

## Troubleshooting

### No site configured

Run `SkyCMS: Add Site`, then retry sign-in.

### Sign-in browser did not open

Allow external URL launch from VS Code, then retry `SkyCMS: Sign In`.

### Tree is empty after sign-in

Run `SkyCMS: Refresh`. If still empty, sign out and sign in again.

### Save fails with auth errors

Run `SkyCMS: Sign Out`, then run `SkyCMS: Sign In` to refresh token state.

### Preview command fails for an item

Refresh the tree and retry. Some preview actions require server-provided preview IDs.

## Current preview limitations

- File watching is refresh-oriented. Tree updates are not a full live watch implementation.
- Concurrent edits to the same field or file do not provide conflict-merge UX.
- Chat responses depend on the selected language model availability in VS Code.

## Related guides

- [VS Code Explorer Quick Tour](../../getting-started/vscode-explorer-quick-tour.md)
- [Why SkyCMS Is Different](../../getting-started/why-skycms-is-different.md)
- [Code Editor](../../for-editors/code-editor.md)
- [File Manager](../../for-editors/file-manager.md)
- [Layouts, Templates & Articles](../layouts-templates-articles.md)
- [AI Integration](../ai-integration.md)
- [Troubleshooting](../../reference/troubleshooting.md)
