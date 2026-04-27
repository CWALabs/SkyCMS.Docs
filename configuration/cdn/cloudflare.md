<!-- Audience: DevOps -->
<!-- Type: How-to -->
<!-- Status: Draft -->
<!-- Source: SkyCMS/Docs/Configuration/CDN-Cloudflare.md -->

# CDN: Cloudflare

## When to use Cloudflare

Use Cloudflare when your site is fronted by a Cloudflare zone and you want publish-time cache purging with scoped API tokens.

## Required settings

- zone ID,
- API token with Zone Cache Purge permissions for the target zone.

## Credential setup

Use [Create a Cloudflare API Token for Cache Purge](./cloudflare-token-for-cache-purge.md) for step-by-step instructions on:

- finding the correct zone ID,
- choosing between user and account-owned tokens,
- creating a least-privilege token,
- verifying the token before using it in SkyCMS.

## Routing and cache rules

Recommended rules:

- purge targeted paths where possible,
- keep token scope limited to the production zone,
- rotate tokens and update configuration regularly.

## Validation checklist

- token and zone ID pass save/test,
- publish triggers purge successfully,
- updated pages appear without stale cache artifacts.

## Related guides

- [CDN Overview](./overview.md)
- [CDN Configuration Reference](./configuration-reference.md)
- [Create a Cloudflare API Token for Cache Purge](./cloudflare-token-for-cache-purge.md)
