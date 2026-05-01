---
canonical_title: Architecture Executive Summary
description: Stakeholder-level summary of SkyCMS architecture, deployment patterns, and governance model.
doc_type: Explanation
product_area: architecture
user_intent: understand-architecture-executive-summary
audience:
  - Developers
difficulty: advanced
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-28
---

# Architecture Executive Summary

## Summary

Stakeholder-level summary of SkyCMS architecture, deployment patterns, and governance model.

> **Reading path:** [Architecture overview](./architecture.md) > **Architecture Executive Summary** > [Core Platform Architecture](./architecture-core-platform.md) > [Architecture Decision Matrix](./architecture-decision-matrix.md)

## One-page summary

SkyCMS is a multi-tenant CMS platform with clear separation between authoring and public delivery. The platform supports static, dynamic, and hybrid delivery patterns so teams can choose the right balance of performance, flexibility, and operational complexity.

## What is stable across all modes

1. Tenant-aware architecture is foundational and enforced early in request flow.
2. Editor and Publisher remain independently deployable.
3. Publish actions are the control point for public content lifecycle.
4. Storage, CDN, and database providers are pluggable behind consistent abstractions.

## Delivery options at a glance

| Delivery option | Best for | Primary benefit | Primary tradeoff |
| --- | --- | --- | --- |
| Static | Public, cache-heavy content estates | Lowest request-time cost and high edge performance | Less request-time flexibility |
| Dynamic | Interactive or personalized experiences | Maximum runtime flexibility | Higher runtime complexity and cost |
| Hybrid | Mostly static with protected or specialized routes | Balance of performance and control | Requires clear route governance |

## Governance and decision model

1. Architecture choices are backed by ADRs.
2. Mode selection uses the architecture decision matrix.
3. High-impact changes should pass the architecture review checklist.

## Current architecture trajectory

The architecture documentation model is moving from scattered topic references to a structured, comparable framework:

1. Core platform architecture as the canonical base model.
2. Mode-specific profiles with consistent sections and route-class guidance.
3. Decision matrix for selecting static, dynamic, or hybrid patterns.
4. ADR summary mapping for rapid governance onboarding.

## Read next

1. [Architecture Overview](architecture.md)
2. [Core Platform Architecture](architecture-core-platform.md)
3. [Architecture Decision Matrix](architecture-decision-matrix.md)
4. [Architecture Review Checklist](architecture-review-checklist.md)
