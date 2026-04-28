---
canonical_title: CDN: Azure Front Door
description: Configure Azure Front Door cache purge integration for SkyCMS publish workflows.
doc_type: How-to
product_area: configuration
user_intent: configure-skycms-azure-front-door-purging
audience:
	- DevOps
	- Administrators
difficulty: intermediate
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# CDN: Azure Front Door

## Summary

Use Azure Front Door when you need global edge routing and Azure-native cache purging after publish.

## Outcome

After completing this guide, SkyCMS will purge the Azure Front Door cache on the configured endpoint after each content publish.

## Steps

1. Navigate to **Settings → CDN** in the SkyCMS admin panel.
2. Select **Azure Front Door** as the provider.
3. Enter the subscription ID, resource group, Front Door profile name, and endpoint name.
4. Assign the identity or service principal with cache purge rights as described in the routing section below.
5. Click **Test Connection** to confirm permissions, then click **Save**.

## Required settings

- subscription ID,
- resource group,
- Front Door profile name,
- endpoint name,
- identity or role with endpoint cache purge rights.

## Routing and cache rules

Recommended rules:

- purge only affected paths after publish,
- keep cache TTL aligned with update frequency,
- avoid wildcard purges unless required for emergency refresh.

## Validation checklist

- settings save or test succeeds,
- endpoint identifiers resolve correctly,
- post-publish changes become visible without manual hard-refresh.

## Related guides

- [CDN Overview](./overview.md)
- [Azure Front Door Credentials](./azure-front-door-credentials.md)
- [CDN Configuration Reference](./configuration-reference.md)
