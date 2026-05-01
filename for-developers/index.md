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
last_reviewed: 2026-04-27
---

# For Developers

## Summary

Start here for SkyCMS developer architecture, API, lifecycle, and implementation guidance.

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

## Related guides

- [For Editors](../for-editors/index.md)
- [For Site Builders](../for-site-builders/index.md)
