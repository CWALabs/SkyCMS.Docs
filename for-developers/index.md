---
canonical_title: For Developers
description: Start here for SkyCMS developer architecture, API, lifecycle, and implementation guidance.
doc_type: Explanation
product_area: development
user_intent: find-developer-guides-and-reference-docs
audience:
  - Developers
difficulty: beginner
version: current
status: active
owner: docs-platform
last_reviewed: 2026-05-13
---

# For Developers

## Summary

Start here for SkyCMS developer architecture, API, lifecycle, and implementation guidance.

Decision guidance: use this page when your main goal is to implement, extend, integrate, deploy, or troubleshoot SkyCMS platform behavior.

> **What's new in 12.4.0:** SkyCMS VS Code Explorer adds a major content-as-code workflow for developers who want full IDE tooling, extension support, and direct CMS operations in Visual Studio Code. Install it from the [Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=cwalabs.skycms-explorer) and review the [Changelog](../reference/changelog.md).

SkyCMS supports a code-first development model without sacrificing editor usability. Developers can implement and maintain websites with familiar architecture and tooling, while content teams continue routine updates through visual editing.

## Role overview

SkyCMS content roles work together like this:

- Editors run day-to-day content workflows.
- Site builders control presentation structure and design systems.
- Developers own application behavior, extensibility, and operations.

In this section, a developer is the person responsible for building and maintaining SkyCMS internals, integrations, and platform reliability.

Developers typically:

- Implement and maintain features, APIs, and middleware.
- Define and evolve content lifecycle behavior.
- Build integrations for storage, auth, and external services.
- Maintain performance, observability, and deployment quality.
- Add tests and uphold architecture and tenant isolation constraints.

## Developer experience philosophy

SkyCMS is designed to remove unnecessary constraints on implementation style. You can work through templates, APIs, infrastructure, and IDE-centric workflows instead of being locked into a rigid CMS authoring model.

When you want to interact with CMS content and structure from inside your IDE, use the [SkyCMS VS Code Extension](./extending/vscode-extension.md) to work with SkyCMS resources as code.

For the complete permission matrix and cross-role responsibilities, see [Roles and permissions (RBAC)](./roles-and-permissions.md).

## Start here

If you are new to SkyCMS development, start with these five pages:

1. [Developer guide overview](./overview.md)
1. [Architecture overview](./architecture.md)
1. [Core platform architecture](./architecture-core-platform.md)
1. [API docs overview](./api/overview.md)
1. [Website launch workflow](./website-launch/index.md)

## Then go deeper by task

### Architecture and platform

- [Architecture diagram catalog](./architecture-diagram-catalog.md)
- [Architecture executive summary](./architecture-executive-summary.md)
- [Architecture decision matrix](./architecture-decision-matrix.md)
- [Architecture mode selection worksheet](./architecture-mode-selection-worksheet.md)
- [Architecture route inventory templates](./architecture-route-inventory-templates.md)
- [Static architecture profile](./architecture-profile-static.md)
- [Dynamic architecture profile](./architecture-profile-dynamic.md)
- [Hybrid architecture profile](./architecture-profile-hybrid.md)
- [Architecture review checklist](./architecture-review-checklist.md)
- [Architecture change log](./architecture-change-log.md)
- [Middleware pipeline](./middleware-pipeline.md)
- [Multi-tenancy deep dive](./multi-tenancy-deep-dive.md)

### Implementation and delivery

- [Layouts](./layouts.md)
- [Templates](./templates.md)
- [Layouts, templates, and articles](./layouts-templates-articles.md)
- [Article lifecycle](./article-lifecycle.md)
- [Publisher rendering flow diagrams](./publisher-rendering-flow.md)
- [Roles and permissions (RBAC)](./roles-and-permissions.md)
- [Configuration overview](../configuration/overview.md)
- [Creating editable areas](./website-launch/CreatingEditableAreas.md)

### Documentation standards (internal)

- [Documentation standards stack v1](./documentation-standards-stack-v1.md)
- [Documentation visual style standard (DVSS)](./documentation-visual-style-standard.md)
- [Documentation metadata schema v1](./documentation-metadata-schema.md)
- [Documentation templates](./documentation-templates.md)
- [Documentation PR checklist](./documentation-pr-checklist.md)
- [Documentation adoption priority plan](./documentation-adoption-priority-plan.md)
- [Documentation rollout plan](./documentation-rollout-plan.md)
- [Documentation standards gap review and upgrade plan (2026-04)](./documentation-standards-gap-review-2026-04.md)

## Verification

You are in the right developer workflow when you can identify the correct architecture and API references for your task, apply the related implementation guide, and validate changes against platform constraints.

## Next steps

- [For Editors](../for-editors/index.md) when validating authoring workflows and publishing operations.
- [For Site Builders](../for-site-builders/index.md) when collaborating on layout/template composition and handoff.
- [What Is SkyCMS?](../getting-started/what-is-skycms.md) when introducing architecture context to new contributors.

## Deep dive

- [Architecture overview](./architecture.md)
- [API docs overview](./api/overview.md)
- [SkyCMS VS Code Extension](./extending/vscode-extension.md)

## Related guides

- [For Editors](../for-editors/index.md)
- [For Site Builders](../for-site-builders/index.md)
