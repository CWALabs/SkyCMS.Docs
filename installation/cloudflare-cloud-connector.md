---
canonical_title: Cloudflare Cloud Connector
description: Route SkyCMS storage traffic through Cloudflare Cloud Connector instead of building the full edge rule set manually.
doc_type: How-to
product_area: installation
user_intent: configure-cloudflare-cloud-connector-for-skycms-storage
audience:
	- Developers
	- DevOps
difficulty: intermediate
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# Cloudflare Cloud Connector

## Summary

Use this guide when you want Cloudflare to route to object storage using Cloud Connector instead of manually creating full edge routing rules.

## What it does

Cloud Connector simplifies storage routing by automatically handling host header and TLS adjustments for supported providers.

## Prerequisites

- Cloudflare account with Cloud Connector availability.
- Public cloud storage bucket.
- Proxied domain in Cloudflare.

## Outcome

After completing this guide, Cloudflare should be able to route requests to the backing storage target with less manual edge-rule work.

## Setup flow

1. Create Cloud Connector rule in Cloudflare dashboard.
2. Select provider and bucket target.
3. Add cache rule for content caching policy.
4. Add URL rewrite rules if path mapping is needed.
5. Validate behavior with production-like requests.

## Cloud Connector vs manual edge rules

- Cloud Connector: faster setup, less boilerplate.
- Manual rules: more direct control over path and host-specific logic.

For manual rule configuration patterns, see [Cloudflare Edge Hosting](cloudflare-edge-hosting.md).

## Verification

This setup is complete when production-like requests resolve through Cloudflare correctly and the expected content paths map to the target bucket without host or TLS errors.

## Related guides

- [Cloudflare Edge Hosting](cloudflare-edge-hosting.md)
- [Cloudflare R2 Storage](../configuration/storage/cloudflare-r2.md)
