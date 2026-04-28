---
canonical_title: CDN Configuration Reference
description: Reference for required CDN provider fields, security requirements, and validation checks for SkyCMS cache purging.
doc_type: Reference
product_area: configuration
user_intent: find-required-cdn-provider-fields
audience:
	- Developers
	- DevOps
difficulty: intermediate
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# CDN Configuration Reference

## Summary

Use this page for exact provider field requirements and operational validation checks for SkyCMS CDN integrations.

## Required fields by provider

### Azure Front Door

- subscription ID
- resource group
- profile name
- endpoint name

### Cloudflare

- zone ID
- API token with cache purge permission

See [Create a Cloudflare API Token for Cache Purge](./cloudflare-token-for-cache-purge.md) for the exact Cloudflare dashboard steps.

### CloudFront

- distribution ID
- access key ID
- secret access key
- region

### Sucuri

- API key
- API secret

## Security guidance

- use least-privilege credentials,
- scope tokens/roles to required resources only,
- rotate credentials and update runtime secrets.

## Validation checklist

- save/test passes,
- provider logs show successful purge/invalidation,
- post-publish content freshness is confirmed.

## Related guides

- [CDN Overview](./overview.md)
