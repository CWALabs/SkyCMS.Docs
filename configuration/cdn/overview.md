---
canonical_title: CDN Overview
description: Choose and configure a CDN provider for SkyCMS cache invalidation and content freshness after publish.
doc_type: Explanation
product_area: configuration
user_intent: choose-and-configure-skycms-cdn
audience:
  - Developers
  - Administrators
  - DevOps
difficulty: beginner
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# CDN Overview

## Summary

Use this page to select a supported CDN provider and configure cache purge behavior after publication.

## Supported providers

- Azure Front Door
- Cloudflare
- CloudFront
- Sucuri

## Key behavior

SkyCMS can issue CDN purge or invalidation requests after publish so updated content becomes visible faster at edge locations.

## Provider setup sequence

1. Gather provider identifiers and purge credentials.
2. Configure CDN settings in SkyCMS.
3. Validate configuration with the provider test or save step.
4. Publish content and verify freshness on public URLs.

## Validation checklist

- publish completes successfully,
- the CDN purge call succeeds,
- the updated page and assets are visible at the expected edge URLs,
- no persistent CDN auth or quota errors appear in logs.

## Related guides

- [CDN Configuration Reference](./configuration-reference.md)
- [Azure Front Door](./azure-front-door.md)
- [Cloudflare](./cloudflare.md)
- [Create a Cloudflare API Token for Cache Purge](./cloudflare-token-for-cache-purge.md)
- [CloudFront](./cloudfront.md)
- [Sucuri](./sucuri.md)
- [Publishing Workflow](../../deployment/publishing-workflow.md)
