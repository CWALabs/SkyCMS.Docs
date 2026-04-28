---
canonical_title: SkyCMS Developer Guide Overview
description: Navigate SkyCMS developer documentation by architecture, extension area, workflow stage, and implementation task.
doc_type: Explanation
product_area: developer-experience
user_intent: find-right-skycms-developer-guide
audience:
  - Developers
difficulty: intermediate
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# SkyCMS Developer Guide Overview

## Summary

Navigate SkyCMS developer documentation by architecture, extension area, workflow stage, and implementation task.

## Context

SkyCMS development work usually spans four concerns:

- platform architecture and request flow,
- content and rendering behavior,
- integration and provider configuration,
- deployment and operational reliability.

This overview maps each concern to the most useful deep-dive pages.

Use the sections below as an intent-first map: identify the kind of work you are doing, then jump to the corresponding deep-dive guide.

## Architecture map

Use these pages first when planning changes or debugging core behavior:

- [Architecture Overview](./architecture.md)
- [Core Platform Architecture](./architecture-core-platform.md)
- [Architecture Diagram Catalog](./architecture-diagram-catalog.md)
- [Multi-Tenancy Deep Dive](./multi-tenancy-deep-dive.md)
- [Middleware Pipeline](./middleware-pipeline.md)

## Extension points

Use these guides when extending behavior or integrating providers:

- [Layouts](./layouts.md)
- [Templates](./templates.md)
- [Layouts, Templates, and Articles](./layouts-templates-articles.md)
- [Roles and Permissions](./roles-and-permissions.md)
- [EF Cross-Provider Guide](./ef-cross-provider-guide.md)

## Development workflow

Use these pages for implementation planning and release readiness:

- [Website Launch Workflow](./website-launch/index.md)
- [Article Lifecycle](./article-lifecycle.md)
- [Configuration Overview](../configuration/overview.md)
- [Deployment Overview](../deployment/overview.md)

## Verification

You are on the right guide path when you can:

- identify where your change belongs in architecture and workflow,
- select the correct extension or integration guide,
- define required tests for provider and tenant-aware behavior,
- complete implementation with clear deployment and validation follow-through.

## Testing strategy

When validating changes:

- start with behavior-specific unit and integration tests in the relevant solution project,
- validate cross-provider compatibility for EF-backed queries,
- verify tenant-aware behavior through the established multi-tenant context flow,
- run local smoke tests for authoring and publishing paths when UI or rendering paths change.

## Decisions and tradeoffs

- Role-based documentation is simple to browse but can hide intent-first paths.
- Architecture-first reading reduces implementation mistakes but may slow quick fixes.
- Task-first links from this page are designed to reduce context switching.

## Related guides

- [For Developers Start Here](./index.md)
- [API Overview](./api/overview.md)
- [Architecture Review Checklist](./architecture-review-checklist.md)
- [Documentation Standards Stack v1](./documentation-standards-stack-v1.md)
