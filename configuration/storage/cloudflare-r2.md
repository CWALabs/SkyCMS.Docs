---
canonical_title: Storage: Cloudflare R2
description: Configure Cloudflare R2 for SkyCMS object storage with S3-compatible access patterns.
doc_type: How-to
product_area: configuration
user_intent: configure-skycms-cloudflare-r2-storage
audience:
	- Developers
	- DevOps
difficulty: intermediate
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# Storage: Cloudflare R2

## Summary

Use Cloudflare R2 when you need S3-compatible object storage with Cloudflare ecosystem integration and egress-friendly economics.

## Outcome

After completing this guide, SkyCMS will store media and published artifacts in the configured Cloudflare R2 bucket using S3-compatible access.

## Required settings

- account-specific endpoint,
- bucket name,
- access key ID,
- secret access key.

## Credential setup

Use [Create Cloudflare R2 API Credentials](./cloudflare-r2-api-credentials.md) for step-by-step instructions on:

- finding the Cloudflare account ID,
- choosing bucket-scoped writable access,
- creating account-owned or user-owned R2 credentials,
- building the correct endpoint for standard or jurisdictional buckets.

## Example configuration

Configure R2 using S3-compatible settings and validate endpoint or region compatibility in your runtime configuration.

## Validation checklist

- storage connectivity succeeds,
- upload, read, and delete paths work,
- published assets are accessible through expected public path or CDN behavior.

## Related guides

- [Storage Overview](./overview.md)
- [Storage Configuration Reference](./configuration-reference.md)
- [Create Cloudflare R2 API Credentials](./cloudflare-r2-api-credentials.md)
