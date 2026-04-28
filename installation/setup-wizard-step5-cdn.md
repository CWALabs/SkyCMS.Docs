---
canonical_title: Setup Wizard Step 5 CDN
description: Configure optional CDN cache invalidation so published changes can purge cached content automatically.
doc_type: How-to
product_area: installation
user_intent: configure-cdn-invalidation-during-setup
audience:
	- Developers
	- Administrators
difficulty: beginner
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# Setup Wizard: Step 5 CDN (Optional)

## Summary

Configure CDN cache invalidation integration for published content.

## Provider options

- Azure Front Door
- Cloudflare
- Amazon CloudFront
- Sucuri
- None

## Key guidance

- Supply provider credentials with purge/invalidation permissions.
- Validate provider IDs and resource names.
- If not ready, skip and configure later.

## When to skip this step

Skip CDN configuration when the environment is still local, pre-production, or not yet fronted by a CDN. Adding it later is safer than guessing provider IDs or using overly broad credentials.

If you are using Cloudflare, start with [Create a Cloudflare API Token for Cache Purge](../configuration/cdn/cloudflare-token-for-cache-purge.md).

## Verification

This step is complete when provider details are accepted and you have confidence the configured token or key has the minimum purge permissions required.

## Next step

Proceed to [Setup Wizard: Step 6 Review and Complete](setup-wizard-step6-review.md).

## Related guides

- [CDN Overview](../configuration/cdn/overview.md)
- [CDN Configuration Reference](../configuration/cdn/configuration-reference.md)
- [Create a Cloudflare API Token for Cache Purge](../configuration/cdn/cloudflare-token-for-cache-purge.md)
