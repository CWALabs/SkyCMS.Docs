<!-- Audience: Developers and DevOps -->
<!-- Type: How-to -->
<!-- Status: Draft -->
<!-- Source: SkyCMS/Docs/Installation/CloudflareEdgeHosting.md -->

# Cloudflare Edge Hosting

## When to use this page

Use this guide when hosting a static SkyCMS output with Cloudflare R2 and Cloudflare edge rules in an origin-less pattern.

## Prerequisites

- Cloudflare account with R2.
- Bucket, API credentials, and custom domain capability.
- SkyCMS publishing configured to target R2.

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

## Related guides

- [cloudflare-cloud-connector.md](cloudflare-cloud-connector.md)
- [../configuration/storage/cloudflare-r2.md](../configuration/storage/cloudflare-r2.md)
- [../deployment/cloudflare.md](../deployment/cloudflare.md)
