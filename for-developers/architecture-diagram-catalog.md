---
canonical_title: Architecture Diagram Catalog
description: Central table of contents for Mermaid architecture diagrams across SkyCMS documentation.
audience:
  - Developers
  - Architects
  - Administrators
doc_type: Reference
status: Draft
entities:
  - diagram-catalog
  - architecture-visuals
keywords:
  - mermaid diagrams
  - architecture toc
  - visual references
---

# Architecture Diagram Catalog

Use this page as the central table of contents for Mermaid diagrams across architecture, deployment, and related reference docs.

## Quick filters

- **Platform architecture:** [Core architecture](#core-architecture), [Publisher and delivery internals](#publisher-and-delivery-internals)
- **Delivery profiles:** [Delivery profiles and rendering](#delivery-profiles-and-rendering)
- **Multi-tenancy and lifecycle:** [Multi-tenancy and lifecycle](#multi-tenancy-and-lifecycle)
- **Operations and deployment:** [Deployment and operations](#deployment-and-operations)
- **AI and integration:** [AI and integration](#ai-and-integration)
- **Editor workflows and APIs:** [Editor workflows and API](#editor-workflows-and-api)
- **Reference maps:** [Reference feature map](#reference-feature-map)

## How to read this catalog

- Use the page link when you want the full narrative around a diagram.
- Use the section link when you already know the topic and want the diagram directly.
- Treat flowcharts as relationship or decision maps, sequence diagrams as request or event timelines, and state diagrams as lifecycle views.
- New Mermaid diagrams should be added here when they become stable enough to be a durable navigation aid.

## Core architecture

| Page | Diagram sections |
| --- | --- |
| [Core Platform Architecture](architecture-core-platform.md) | [System context](architecture-core-platform.md#system-context), [Container view](architecture-core-platform.md#container-view), [Component relationship view](architecture-core-platform.md#component-relationship-view), [Identity and authorization trust flow](architecture-core-platform.md#identity-and-authorization-trust-flow), [Environment and deployment topology](architecture-core-platform.md#environment-and-deployment-topology), [Roadmap transition view](architecture-core-platform.md#roadmap-transition-view) |
| [Architecture Decision Matrix](architecture-decision-matrix.md) | [Request routing matrix visualization](architecture-decision-matrix.md#request-routing-matrix-visualization) |
| [Architecture Decision Records](architecture-decision-records.md) | [ADR decision dependency map](architecture-decision-records.md#adr-decision-dependency-map) |
| [Architecture Review Checklist](architecture-review-checklist.md) | [Failure mode and recovery map](architecture-review-checklist.md#failure-mode-and-recovery-map) |

## Delivery profiles and rendering

| Page | Diagram sections |
| --- | --- |
| [Static Delivery Architecture Profile](architecture-profile-static.md) | [Runtime topology](architecture-profile-static.md#runtime-topology), [Request path](architecture-profile-static.md#request-path) |
| [Dynamic Delivery Architecture Profile](architecture-profile-dynamic.md) | [Runtime topology](architecture-profile-dynamic.md#runtime-topology), [Request path](architecture-profile-dynamic.md#request-path) |
| [Hybrid Delivery Architecture Profile](architecture-profile-hybrid.md) | [Runtime topology](architecture-profile-hybrid.md#runtime-topology), [Request path patterns](architecture-profile-hybrid.md#request-path-patterns) |
| [Publisher Rendering Flow](publisher-rendering-flow.md) | [End-to-End Publish Path](publisher-rendering-flow.md#end-to-end-publish-path) |

## Multi-tenancy and lifecycle

| Page | Diagram sections |
| --- | --- |
| [Multi-Tenancy Deep Dive](multi-tenancy-deep-dive.md) | [Tenant resolution flow](multi-tenancy-deep-dive.md#tenant-resolution-flow), [Data isolation model](multi-tenancy-deep-dive.md#data-isolation-model) |
| [Tenant Isolation Reference](tenant-isolation-reference.md) | [Isolation boundaries map](tenant-isolation-reference.md#isolation-boundaries-map), [Tenant request gate sequence](tenant-isolation-reference.md#tenant-request-gate-sequence) |
| [Article Lifecycle](article-lifecycle.md) | [Lifecycle Model](article-lifecycle.md#lifecycle-model), [What PublishAsync Does](article-lifecycle.md#what-publishasync-does) |

## Publisher and delivery internals

| Page | Diagram sections |
| --- | --- |
| [Publisher Architecture](publisher-architecture.md) | [Startup Decision](publisher-architecture.md#startup-decision), [Editor and publisher shared platform model](publisher-architecture.md#editor-and-publisher-shared-platform-model) |
| [Content Delivery Architecture](content-delivery-architecture.md) | [Delivery topology](content-delivery-architecture.md#delivery-topology), [PubController request flow](content-delivery-architecture.md#protected-file-serving-pubcontroller), [CDN Integration](content-delivery-architecture.md#cdn-integration) |

## Deployment and operations

| Page | Diagram sections |
| --- | --- |
| [Publishing in SkyCMS](../deployment/publishing-workflow.md) | [Publishing Modes](../deployment/publishing-workflow.md#publishing-modes), [Publishing Workflows](../deployment/publishing-workflow.md#publishing-workflows) |
| [CI/CD Pipelines](../deployment/cicd-pipelines.md) | [CI/CD topology](../deployment/cicd-pipelines.md#cicd-topology), [Workflow Dependencies](../deployment/cicd-pipelines.md#workflow-dependencies) |

## AI and integration

| Page | Diagram sections |
| --- | --- |
| [AI Configuration Overview](../configuration/ai/overview.md) | [AI provider integration topology](../configuration/ai/overview.md#ai-provider-integration-topology) |
| [AI Integration Architecture](ai-integration.md) | [AI request and response sequence](ai-integration.md#ai-request-and-response-sequence) |

## Editor workflows and API

| Page | Diagram sections |
| --- | --- |
| [Real-Time Collaborative Editing](../for-editors/collaborative-editing.md) | [How It Works](../for-editors/collaborative-editing.md#how-it-works) |
| [Sky.Cms.Api.Shared Documentation](api/overview.md) | [Architecture](api/overview.md#architecture) |
| [SkyCMS Docs Publisher](../installation/docs-publisher.md) | [DocsPublisher runtime topology](../installation/docs-publisher.md#docspublisher-runtime-topology) |

## Reference feature map

| Page | Diagram sections |
| --- | --- |
| [Multi-Tenancy and Architecture feature reference](../reference/features/07-multi-tenancy-and-architecture.md) | [Architecture relationship map](../reference/features/07-multi-tenancy-and-architecture.md#architecture-relationship-map) |

## Related docs

- [Architecture Overview](architecture.md)
- [Developer Index](index.md)
