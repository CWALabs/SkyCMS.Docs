<!-- Audience: Developers and DevOps -->
<!-- Type: Explanation -->
<!-- Status: Draft -->
<!-- Source: SkyCMS/Docs/Configuration/CDN-Overview.md -->

# CDN Overview

## When to use this page

Use this guide when you need CDN cache purging after publish and are choosing a supported CDN provider.

## Supported providers

- Azure Front Door,
- Cloudflare,
- CloudFront,
- Sucuri.

## Key behavior

SkyCMS can issue cache purge/invalidation requests after publish so content changes become visible faster.

## Provider setup order

1. Gather provider IDs and purge credentials.
2. Configure provider settings in SkyCMS.
3. Run save/test validation.
4. Publish and verify cache freshness.

## Related guides

- [CDN Configuration Reference](./configuration-reference.md)
- [Azure Front Door](./azure-front-door.md)
- [Cloudflare](./cloudflare.md)
- [CloudFront](./cloudfront.md)
- [Sucuri](./sucuri.md)
