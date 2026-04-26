---
canonical_title: SkyCMS Architecture Overview
description: Core architecture map for SkyCMS with deployment mode profiles and a selection matrix.
audience:
	- Developers
	- Architects
doc_type: Explanation
status: Canonical
entities:
	- architecture
	- multi-tenancy
	- publishing
	- static-mode
	- dynamic-mode
	- hybrid-mode
keywords:
	- architecture overview
	- static publishing
	- dynamic rendering
	- hybrid delivery
	- decision matrix
---

# Architecture Overview

## When to use this page

Use this page when you need to:

- understand the complete SkyCMS architecture at a platform level,
- choose between static, dynamic, and hybrid delivery patterns,
- navigate to the right deep-dive architecture document.

## Architecture layers

SkyCMS can be read as four architecture layers that stay stable across hosting modes.

| Layer | Responsibility | Core components |
| --- | --- | --- |
| Experience layer | Authoring and site operations | Sky.Editor, visual editors, setup and admin UX |
| Application layer | API, orchestration, request handling | Controllers, mediator handlers, middleware, SignalR hubs |
| Content delivery layer | Public content delivery | Sky.Publisher, StaticProxyController, PubController, CDN |
| Data and platform layer | Persistence, identity, and storage | ApplicationDbContext, DynamicConfigDbContext, CosmosIdentityDbContext, IStorageContext |

## Canonical architecture references

- [Core Platform Architecture](architecture-core-platform.md)
- [Architecture Executive Summary](architecture-executive-summary.md)
- [Publisher Architecture](publisher-architecture.md)
- [Publisher Rendering Flow](publisher-rendering-flow.md)
- [Content Delivery Architecture](content-delivery-architecture.md)
- [Multi-Tenancy Deep Dive](multi-tenancy-deep-dive.md)
- [Tenant Isolation Reference](tenant-isolation-reference.md)
- [Current state and target state](architecture-core-platform.md#current-state-and-target-state)
- [Phased migration roadmap](architecture-core-platform.md#phased-migration-roadmap)

## Delivery mode profiles

Use these profile documents to understand how topology, runtime behavior, and operations change by delivery model.

- [Static Delivery Architecture Profile](architecture-profile-static.md)
- [Dynamic Delivery Architecture Profile](architecture-profile-dynamic.md)
- [Hybrid Delivery Architecture Profile](architecture-profile-hybrid.md)
- [Architecture Decision Matrix](architecture-decision-matrix.md)
- [Architecture Mode Selection Worksheet](architecture-mode-selection-worksheet.md)
- [Architecture Route Inventory Templates](architecture-route-inventory-templates.md)

## Visual architecture maps

Use these pages for Mermaid-based architecture visualizations.

- [Core Platform Architecture diagrams](architecture-core-platform.md)
- [Multi-Tenancy Deep Dive diagrams](multi-tenancy-deep-dive.md)
- [Publisher Rendering Flow diagrams](publisher-rendering-flow.md)
- [Architecture Diagram Catalog](architecture-diagram-catalog.md)
- [Architecture Decision Records dependency map](architecture-decision-records.md#adr-decision-dependency-map)
- [Architecture Review Checklist failure and recovery map](architecture-review-checklist.md#failure-mode-and-recovery-map)

## Diagram legend and conventions

Use this legend when reading architecture diagrams across the developer docs.

| Diagram shape or pattern | Meaning |
| --- | --- |
| Rectangle node | Application component or logical service |
| Rounded or grouped subgraph | Deployment or responsibility boundary |
| Database cylinder | Persisted store (database, storage, cache) |
| Directed arrow | Dependency or runtime interaction direction |
| Sequence participant | Actor or service involved in ordered call flow |
| Decision diamond | Branching condition in flow diagrams |

Conventions used throughout:

1. Left-to-right flow diagrams show high-level dependency direction.
2. Top-to-bottom flow diagrams show request progression and control flow.
3. Sequence diagrams show time-ordered runtime interactions.
4. Route and security decisions are shown at branch points near request entry.
5. Diagram text uses canonical SkyCMS terms to align with ADR and architecture docs.

## End-to-end lifecycle map

At a high level, SkyCMS follows this lifecycle:

1. Tenant is resolved early using domain-aware middleware and dynamic configuration.
2. Editors author and publish content through tenant-scoped services.
3. Publish flow writes canonical published records and optional static artifacts.
4. Public requests are served through static, dynamic, or hybrid delivery paths.
5. Cache invalidation and CDN purge align edge behavior with the latest publish state.

## Architecture governance

SkyCMS architecture decisions are tracked as ADRs in the canonical ADR set.

- [Architecture Decision Records](architecture-decision-records.md)
- [Architecture topic summaries](architecture-decision-records.md#architecture-topic-summaries)
- [Architecture Review Checklist](architecture-review-checklist.md)
- [Architecture Change Log](architecture-change-log.md)

Use ADRs for intent and constraints, and use the profile pages for operational implementation guidance.

## Suggested reading order

1. Read [Architecture Executive Summary](architecture-executive-summary.md) for stakeholder-level framing.
2. Read [Core Platform Architecture](architecture-core-platform.md) for the stable system model.
3. Read [Architecture Decision Matrix](architecture-decision-matrix.md) to choose a delivery pattern.
4. Complete [Architecture Mode Selection Worksheet](architecture-mode-selection-worksheet.md).
5. Fill [Architecture Route Inventory Templates](architecture-route-inventory-templates.md) for candidate routes.
6. Read the selected profile document (static, dynamic, or hybrid).
7. Follow linked deep dives for tenant isolation, rendering flow, and delivery internals.

## See also

- [Middleware Pipeline](middleware-pipeline.md)
- [Article Lifecycle](article-lifecycle.md)
- [Deployment Overview](../deployment/overview.md)
- [Publishing Workflow](../deployment/publishing-workflow.md)
- [Architecture Change Log](architecture-change-log.md)
