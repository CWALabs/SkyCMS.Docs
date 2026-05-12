---
canonical_title: Canonical Content Model (Conical Docs)
description: Governance model for combining workflow docs with single-source-of-truth feature pages in SkyCMS documentation.
doc_type: Reference
product_area: editor
user_intent: maintain-consistent-doc-ownership
audience:
  - Documentation Contributors
  - Product Owners
  - Developers
  - Content Editors
difficulty: intermediate
version: current
status: active
owner: docs-platform
last_reviewed: 2026-05-01
---

# Canonical Content Model (Conical Docs)

Use this page to keep both documentation approaches working together:

- workflow guides for onboarding and day-to-day use,
- canonical feature pages as single sources of truth.

## Core Rule

Each user-facing editor surface has one canonical page that owns:

- what the feature is,
- when to use it,
- control and button behavior,
- common tasks,
- constraints and troubleshooting.

All other pages should summarize and link back to that canonical page unless the detail is specific to their own topic.

## Layered Documentation Architecture

| Layer | Purpose | Content style |
| --- | --- | --- |
| Canonical feature pages | Single source of truth per feature/screen | Full feature detail, control maps, step-by-step tasks |
| Workflow and role guides | Help users complete outcomes quickly | Task paths, minimal feature detail, links to canonical pages |
| Deep references | Advanced internals and edge behavior | Architecture, APIs, implementation details |

## Duplication Policy

Allowed duplication:

- one to three lines of context needed by a workflow topic,
- glossary-level definitions,
- short reminders directly needed to complete the current task.

Not allowed duplication:

- full control tables copied from canonical pages,
- repeated long "when to use" sections across multiple guides,
- separate and conflicting versions of the same feature behavior.

## Ownership Model

- Canonical pages are edited first.
- Workflow and deep reference pages are updated second.
- If behavior changes in product UI, update canonical page in the same PR.
- If workflow guidance changes, link to canonical page rather than duplicating details.

## Existing Canonical Pages

- [Visual Editor](./visual-editor.md)
- [Code Editor](./code-editor.md)
- [Page Builder](./page-builder.md)
- [Image Editor](./image-editor.md)
- [File Management](./file-management.md)
- [Email Management](./email-management.md)

## Consolidation Pass Checklist

1. Find duplicate feature detail in non-canonical pages.
2. Keep only context needed for that page's goal.
3. Link to canonical page for full feature behavior.
4. Verify all links and navigation entries.
5. Validate changes with docs lint/link checks.
