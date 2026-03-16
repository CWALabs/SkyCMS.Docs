<!-- Audience: Developers and DevOps -->
<!-- Type: How-to -->
<!-- Status: Draft -->
<!-- Source: SkyCMS/Docs/Configuration/Storage-Cloudflare.md -->

# Storage: Cloudflare R2

## When to use R2

Use Cloudflare R2 when you need S3-compatible object storage with Cloudflare ecosystem integration and egress-friendly economics.

## Required settings

- account-specific endpoint,
- bucket name,
- access key ID,
- secret access key.

## Example configuration

Configure R2 using S3-compatible settings and validate endpoint/region compatibility in your runtime configuration.

## Validation checklist

- storage connectivity succeeds,
- upload/read/delete paths work,
- published assets are accessible through expected public path/CDN behavior.

## Related guides

- [Storage Overview](./overview.md)
- [Storage Configuration Reference](./configuration-reference.md)
