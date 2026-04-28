---
canonical_title: Architecture Mode Selection Worksheet
description: Practical worksheet to select static, dynamic, or hybrid delivery mode for a SkyCMS workload.
doc_type: Reference
product_area: architecture
user_intent: understand-architecture-mode-selection-worksheet
audience:
  - Developers
difficulty: advanced
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-28
---

# Architecture Mode Selection Worksheet

## Summary

Practical worksheet to select static, dynamic, or hybrid delivery mode for a SkyCMS workload.

## Purpose

Use this worksheet to make delivery mode selection explicit and repeatable for each site or tenant.

## 1. Workload profile

| Field | Value |
| --- | --- |
| Site or tenant name | |
| Owner team | |
| Primary audience | |
| Expected monthly traffic | |
| Peak traffic pattern | |
| Target launch date | |

## 2. Route behavior snapshot

Estimate route distribution before selecting mode.

| Route class | Approximate percentage | Notes |
| --- | --- | --- |
| Public cacheable pages | | |
| Auth-protected pages | | |
| Personalized responses | | |
| Dynamic APIs | | |

## 3. Priority scoring

Score each priority from 1 to 5 where 5 means critically important.

| Priority | Score (1-5) | Notes |
| --- | --- | --- |
| Lowest latency and edge cache efficiency | | |
| Runtime flexibility and personalization | | |
| Operational simplicity | | |
| Cost efficiency | | |
| Protected-content enforcement | | |

## 4. Constraints and assumptions

| Constraint area | Constraint |
| --- | --- |
| Compliance or data policy | |
| Authentication requirements | |
| Team runtime operations capacity | |
| Publish window and freshness expectation | |
| Provider or hosting constraints | |

## 5. Candidate mode evaluation

| Candidate mode | Fit level (High/Medium/Low) | Risks | Mitigations |
| --- | --- | --- | --- |
| Static | | | |
| Dynamic | | | |
| Hybrid | | | |

## 6. Recommended mode decision

| Decision field | Value |
| --- | --- |
| Recommended mode | |
| Decision date | |
| Decision owner | |
| Review date | |

Decision rationale:

- Add rationale here.

## 7. Acceptance checks

1. Route classes are documented in a route inventory table.
2. Cache policy is defined for public and protected paths.
3. Tenant isolation and provider compatibility checks are confirmed.
4. Publish failure and stale-cache mitigation runbooks are linked.

## Related docs

- [Architecture Decision Matrix](architecture-decision-matrix.md)
- [Route Inventory Templates](architecture-route-inventory-templates.md)
- [Architecture Review Checklist](architecture-review-checklist.md)
- [Architecture Change Log](architecture-change-log.md)
