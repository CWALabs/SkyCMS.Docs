---
canonical_title: Cloudflare Edge Hosting
description: Host SkyCMS static output with Cloudflare R2 and edge rules in an origin-less delivery pattern.
doc_type: How-to
product_area: installation
user_intent: host-skycms-output-with-cloudflare-edge-rules-and-r2
audience:
	- Developers
	- DevOps
difficulty: intermediate
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# Cloudflare Edge Hosting

## Summary

Use this guide when hosting a static SkyCMS output with Cloudflare R2 and Cloudflare edge rules in an origin-less pattern.

## Prerequisites

- Cloudflare account with R2.
- Bucket, API credentials, and custom domain capability.
- SkyCMS publishing configured to target R2.

## Outcome

After completing this guide, published SkyCMS content should resolve through Cloudflare using the intended rewrite and redirect rules.

## Core setup flow

1. Create an R2 bucket.
2. Configure `ConnectionStrings__StorageConnectionString` for R2.
3. Bind a custom domain to the bucket.
4. Add rule for root path rewrite to `/index.html`.
5. Add HTTP to HTTPS redirect rule.

For mixed content scenarios (for example MkDocs content plus SkyCMS pages), add an additional targeted rewrite rule for directory index paths before the root rewrite rule.

## SkyCMS storage connection format

```text
AccountId=<account-id>;Bucket=<bucket>;AccessKeyId=<access-key-id>;SecretAccessKey=<secret-access-key>;
```

## Operational notes

- Keep rule order intentional.
- Validate rewrite behavior with trace tools before going live.
- Use cache rules separately for desired TTL behavior.

## Verification

This setup is complete when directory-style URLs resolve to the expected static content, HTTPS redirects work, and edge rules do not create loops or unexpected cache misses.

## Related guides

- [Cloudflare Cloud Connector](cloudflare-cloud-connector.md)
- [Cloudflare R2 Storage](../configuration/storage/cloudflare-r2.md)
- [Cloudflare Deployment](../deployment/cloudflare.md)
