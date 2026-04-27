<!-- Audience: Developers and DevOps -->
<!-- Type: Reference -->
<!-- Status: Draft -->
<!-- Source: SkyCMS/Docs/Configuration/CDN-Configuration-Reference.md -->

# CDN Configuration Reference

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
