<!-- Audience: Developers and DevOps -->
<!-- Type: How-to -->
<!-- Status: Draft -->
<!-- Source: SkyCMS/Docs/Installation/CloudflareCloudConnector.md -->

# Cloudflare Cloud Connector

## When to use this page

Use this guide when you want Cloudflare to route to object storage using Cloud Connector instead of manually creating full edge routing rules.

## What it does

Cloud Connector simplifies storage routing by automatically handling host header and TLS adjustments for supported providers.

## Prerequisites

- Cloudflare account with Cloud Connector availability.
- Public cloud storage bucket.
- Proxied domain in Cloudflare.

## Setup flow

1. Create Cloud Connector rule in Cloudflare dashboard.
2. Select provider and bucket target.
3. Add cache rule for content caching policy.
4. Add URL rewrite rules if path mapping is needed.
5. Validate behavior with production-like requests.

## Cloud Connector vs manual edge rules

- Cloud Connector: faster setup, less boilerplate.
- Manual rules: more direct control over path and host-specific logic.

For manual rule configuration patterns, see [cloudflare-edge-hosting.md](cloudflare-edge-hosting.md).

## Related guides

- [cloudflare-edge-hosting.md](cloudflare-edge-hosting.md)
- [../configuration/storage/cloudflare-r2.md](../configuration/storage/cloudflare-r2.md)
