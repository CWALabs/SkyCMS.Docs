<!-- Audience: DevOps -->
<!-- Type: How-to -->
<!-- Status: Draft -->
<!-- Source: SkyCMS/Docs/Configuration/CDN-AzureFrontDoor.md -->

# CDN: Azure Front Door

## When to use Front Door

Use Azure Front Door when you need global edge routing and Azure-native cache purging after publish.

## Required settings

- subscription ID,
- resource group,
- Front Door profile name,
- endpoint name,
- identity/role with endpoint cache purge rights.

## Routing and cache rules

Recommended rules:

- purge only affected paths after publish,
- keep cache TTL aligned with update frequency,
- avoid wildcard purges unless required for emergency refresh.

## Validation checklist

- settings save/test succeeds,
- endpoint identifiers resolve correctly,
- post-publish changes become visible without manual hard-refresh.

## Related guides

- [CDN Overview](./overview.md)
- [CDN Configuration Reference](./configuration-reference.md)
