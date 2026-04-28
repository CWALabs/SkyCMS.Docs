---
canonical_title: Documentation Gaps
description: Running inventory of SkyCMS features that lack dedicated documentation or need improvement, organized by functional area.
doc_type: Reference
product_area: platform
user_intent: identify-and-prioritize-documentation-gaps
audience:
  - Contributors
  - Developers
difficulty: beginner
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-28
---

# Documentation Gaps

A running inventory of SkyCMS features that lack dedicated documentation or need improvement. Use this list to prioritize documentation work.

**Last updated:** Generated from the [Feature Catalog](index.md) cross-reference pass.

---

## How to Use This List

- **Missing** — No documentation exists for this feature.
- **Partial** — Some coverage exists (e.g., mentioned in another page) but no dedicated guide.
- **Needs update** — Documentation exists but may be outdated or incomplete.

Each entry links back to the feature catalog section where the gap was identified.

---

## Content Editing & Authoring

*All content editing & authoring features now have dedicated documentation. See [Collaborative Editing Guide](../../for-editors/collaborative-editing.md) for real-time editing, article locking, and presence indicators.*

## Content Lifecycle & Publishing

*All content lifecycle features now have dedicated documentation. See [Version History](../../for-editors/version-history.md), [Publishing Modes](../../for-editors/publishing-modes.md), [URL Management](../../for-editors/url-management.md), [Content Export & Import](../../for-editors/content-export-import.md), [Preload & Caching](../../for-editors/preload-and-caching.md), and [Publishing Progress](../../for-editors/publishing-progress.md).*

## Blogging

*All blogging features now have dedicated documentation. See [Blogging Guide](../../for-editors/blogging.md), [Blog API Reference](../../for-developers/api/blog-api.md), and [Blog Architecture](../../for-developers/blog-architecture.md).*

## Site Building

*No major gaps identified — layouts, templates, pages, widgets, and style guide all have dedicated documentation.*

## File & Media Management

*All file & media management features now have dedicated documentation. See [Image Processing API](../../for-developers/image-processing-api.md) and [Content Delivery Architecture](../../for-developers/content-delivery-architecture.md).*

## Administration & Security

*All administration & security features now have dedicated documentation. See [User Management Guide](../../for-editors/user-management.md), [Site Settings Guide](../../for-editors/site-settings.md), [Contact Management Guide](../../for-editors/contact-management.md), [Authentication & SSO Guide](../../for-editors/authentication.md), and [Audit & Logging Guide](../../for-developers/audit-logging.md).*

## Multi-Tenancy & Architecture

*All multi-tenancy & architecture features now have dedicated documentation. See [Tenant Isolation Reference](../../for-developers/tenant-isolation-reference.md), [Publisher Architecture](../../for-developers/publisher-architecture.md), [Publisher Rendering Flow](../../for-developers/publisher-rendering-flow.md), and [EF Cross-Provider Guide](../../for-developers/ef-cross-provider-guide.md).*

## Deployment & Infrastructure

*All deployment & infrastructure features now have dedicated documentation. See [Demo Deployment](../../deployment/demo-deployment.md), [CI/CD Pipelines](../../deployment/cicd-pipelines.md), [Cloudflare Edge Hosting](../../deployment/cloudflare.md), and the documentation operations package: [Standards Stack](../../for-developers/documentation-standards-stack-v1.md), [Metadata Schema](../../for-developers/documentation-metadata-schema.md), [Templates](../../for-developers/documentation-templates.md), [PR Checklist](../../for-developers/documentation-pr-checklist.md), [Rollout Plan](../../for-developers/documentation-rollout-plan.md), and [Gap Review](../../for-developers/documentation-standards-gap-review-2026-04.md).*

### Provider credential setup backlog

This follow-up backlog tracks places where SkyCMS depends on provider-issued API tokens, access keys, or service credentials and should provide easy-to-find step-by-step creation instructions.

| Status | Area | Scope |
| --- | --- | --- |
| DONE | [Cloudflare CDN cache purge](../../configuration/cdn/cloudflare-token-for-cache-purge.md) | Create least-privilege Cloudflare purge token and find the correct zone ID |
| DONE | [Cloudflare R2 credentials](../../configuration/storage/cloudflare-r2-api-credentials.md) | Create bucket-scoped R2 credentials for SkyCMS storage and docs deployment |
| DONE | Azure credentials and deployment identities — [Azure Deployment Credentials](../../configuration/deployment/azure-deployment-credentials.md) | Service principal, managed identity, and deployment secret setup for Azure deployments |
| DONE | Azure credentials — [Azure Blob Credentials](../../configuration/storage/azure-blob-credentials.md), [Azure Front Door Credentials](../../configuration/cdn/azure-front-door-credentials.md), [ACS Credentials](../../configuration/email/azure-communication-services-credentials.md) | Service principal, managed identity, and connection string setup for Azure storage, CDN, and email providers |
| DONE | AWS credentials — [S3 IAM Credentials](../../configuration/storage/aws-s3-iam-credentials.md), [CloudFront IAM Credentials](../../configuration/cdn/aws-cloudfront-iam-credentials.md) | IAM user, policy, and access key setup for S3 storage and CloudFront CDN invalidation |
| DONE | Email and third-party provider tokens — [SendGrid API Key](../../configuration/email/sendgrid-api-key.md) | API key creation and permission scoping for SendGrid transactional email |

---

## Summary

| Category | Documented | Gaps |
| --- | --- | --- |
| Content Editing & Authoring | 6 of 6 features | 0 |
| Content Lifecycle & Publishing | 10 of 10 features | 0 |
| Blogging | 6 of 6 features | 0 |
| Site Building | 6 of 6 features | 0 |
| File & Media Management | 4 of 4 features | 0 |
| Administration & Security | 7 of 7 features | 0 |
| Multi-Tenancy & Architecture | 7 of 7 features | 0 |
| Deployment & Infrastructure | 10 of 10 features | 0 |
| **Total** | **56 of 56 features** | **0** |

**All gaps have been filled.** Every feature in the catalog now has dedicated documentation.

---

## Mermaid Diagram Backlog

This backlog captures high-value pages that currently have no Mermaid diagrams but would benefit from visual relationships, flows, or decision maps.

### Priority 1 (high impact)

| Status | Page | Suggested diagram(s) | Why it helps |
| --- | --- | --- | --- |
| DONE | [for-developers/tenant-isolation-reference.md](../../for-developers/tenant-isolation-reference.md) | Isolation boundary map, request-to-tenant sequence | Core correctness and security comprehension |
| DONE | [for-developers/content-delivery-architecture.md](../../for-developers/content-delivery-architecture.md) | Delivery topology, route-to-runtime map | Clarifies static/dynamic/hybrid runtime ownership |
| DONE | [deployment/publishing-workflow.md](../../deployment/publishing-workflow.md) | Publish sequence, failure and retry flow | Operations and incident response clarity |
| DONE | [deployment/cicd-pipelines.md](../../deployment/cicd-pipelines.md) | Pipeline stages and artifact flow | Faster onboarding for release process |
| DONE | [reference/features/07-multi-tenancy-and-architecture.md](../../reference/features/07-multi-tenancy-and-architecture.md) | Feature-to-architecture relationship graph | Improves catalog scanning and concept linking |
| DONE | [for-developers/publisher-architecture.md](../../for-developers/publisher-architecture.md) | Component dependency graph | Complements rendering-flow deep dive |
| DONE | [for-developers/article-lifecycle.md](../../for-developers/article-lifecycle.md) | Lifecycle state machine | Faster understanding of content state transitions |

### Priority 2 (strong value)

| Status | Page | Suggested diagram(s) | Why it helps |
| --- | --- | --- | --- |
| DONE | [for-editors/publishing-modes.md](../../for-editors/publishing-modes.md) | Mode decision tree, scheduling timeline | Better editor decision support |
| DONE | [for-editors/preload-and-caching.md](../../for-editors/preload-and-caching.md) | Cache layers flow, invalidation map | Reduces cache-related confusion |
| DONE | [for-editors/authentication.md](../../for-editors/authentication.md) | Sign-in and role-check sequence | Easier support and troubleshooting |
| DONE | [configuration/multi-tenancy.md](../../configuration/multi-tenancy.md) | Configuration precedence flow | Helps administrators debug tenant config |
| DONE | [for-developers/ef-cross-provider-guide.md](../../for-developers/ef-cross-provider-guide.md) | Query compatibility decision flow | Makes provider-safe query choices explicit |
| DONE | [for-developers/storage-provider-auto-detection.md](../../for-developers/storage-provider-auto-detection.md) | Provider auto-detection flowchart | Clearer diagnostics for provider selection |
| DONE | [reference/features/08-deployment-and-infrastructure.md](../../reference/features/08-deployment-and-infrastructure.md) | Feature-to-deployment capability map | Better cross-reference for planning |

### Priority 3 (nice to have)

| Status | Page | Suggested diagram(s) | Why it helps |
| --- | --- | --- | --- |
| DONE | [configuration/ai/overview.md](../../configuration/ai/overview.md) | AI provider integration topology | Visual comparison of provider paths |
| DONE | [for-developers/ai-integration.md](../../for-developers/ai-integration.md) | AI request/response architecture sequence | Faster developer adoption |
| DONE | [for-editors/collaborative-editing.md](../../for-editors/collaborative-editing.md) | Collaboration session sequence | Explains locking and live updates |
| DONE | [for-developers/api/overview.md](../../for-developers/api/overview.md) | API domain map | Improves API discovery |
| DONE | [installation/docs-publisher.md](../../installation/docs-publisher.md) | DocsPublisher runtime topology | Clarifies deployment model |

### Execution notes

1. Start with Priority 1 pages and keep each page to one primary diagram plus one optional sequence diagram.
2. Reuse the existing Mermaid init theme pattern used in architecture docs for visual consistency.
3. Validate each batch with markdown diagnostics and link checks after edits.
