---
canonical_title: Architecture Route Inventory Templates
description: Copy-ready route classification templates for static, dynamic, and hybrid SkyCMS architecture reviews.
audience:
  - Developers
  - Architects
  - Platform Engineers
doc_type: Reference
status: Draft
entities:
  - route-inventory
  - route-classification
  - delivery-mode
keywords:
  - route inventory
  - static routes
  - dynamic routes
  - hybrid routes
---

# Architecture Route Inventory Templates

## Purpose

Use these templates during design reviews to classify routes and define runtime and cache expectations.

## How to use

1. Copy the template for the candidate mode.
2. Replace example rows with workload-specific routes.
3. Link the finished table in the architecture mode selection worksheet.

## Static profile route inventory template

| Route class | Pattern examples | Runtime expectation | Auth requirement | Cache policy | Owner |
| --- | --- | --- | --- | --- | --- |
| Public static page | `/`, `/about`, `/docs/*` | Artifact-first response | None | Public CDN cache | |
| Static asset | `/assets/*`, `/pub/images/*` | File streaming | None | Long-lived public cache | |
| SPA fallback | `/app/*` | Fallback to entry artifact | None | Public cache with short revalidation for entry | |
| Operational endpoint | `/healthz` | Runtime health response | None | No-store | |

## Dynamic profile route inventory template

| Route class | Pattern examples | Runtime expectation | Auth requirement | Cache policy | Owner |
| --- | --- | --- | --- | --- | --- |
| Dynamic content page | `/blog/{slug}` | Query and render per request | Optional | Public cache only when safe | |
| Personalized endpoint | `/profile`, `/dashboard` | Identity-aware response | Required | Private cache or no-store | |
| Protected content path | `/members/*` | Authorization before response | Required | Private cache or no-store | |
| Dynamic API endpoint | `/_api/*` | Request-time business logic | Mixed | No-store by default | |

## Hybrid profile route inventory template

| Route class | Pattern examples | Runtime expectation | Auth requirement | Cache policy | Owner |
| --- | --- | --- | --- | --- | --- |
| Public static route | `/`, `/products/*`, `/docs/*` | Static artifact path | None | Public CDN cache | |
| Protected static route | `/pub/articles/{articleNumber}/*` | Auth check then artifact response | Required | Private cache or no-store | |
| Dynamic extension endpoint | `/_api/*` | Dynamic runtime path | Mixed | Endpoint-specific, no-store default | |
| Operational endpoint | `/healthz` | Runtime health response | None | No-store | |

## Validation prompts

1. Are route classes mutually exclusive?
2. Are protected routes blocked from public caching?
3. Does each route class have an owning team?
4. Are cache semantics documented for edge and browser separately when needed?

## Related docs

- [Architecture Decision Matrix](architecture-decision-matrix.md)
- [Architecture Mode Selection Worksheet](architecture-mode-selection-worksheet.md)
- [Architecture Review Checklist](architecture-review-checklist.md)
