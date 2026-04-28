---
canonical_title: CDN: Sucuri
description: Configure Sucuri cache purge integration for SkyCMS publish workflows.
doc_type: How-to
product_area: configuration
user_intent: configure-skycms-sucuri-cache-purging
audience:
	- DevOps
	- Administrators
difficulty: intermediate
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# CDN: Sucuri

## Summary

Use Sucuri when your site is protected or accelerated through Sucuri and you need cache purge integration after publish.

## Outcome

After completing this guide, SkyCMS will purge the Sucuri cache on publish using the configured API key and secret.

## Required settings

- Sucuri API key,
- Sucuri API secret.

## Validation checklist

- credentials pass save or test,
- purge actions succeed after publish,
- stale content is cleared from edge cache.

## Related guides

- [CDN Overview](./overview.md)
- [CDN Configuration Reference](./configuration-reference.md)
