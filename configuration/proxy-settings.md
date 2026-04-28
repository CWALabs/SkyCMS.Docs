---
canonical_title: Proxy Settings
description: Configure SkyCMS correctly behind reverse proxies, load balancers, and edge gateways.
doc_type: How-to
product_area: configuration
user_intent: configure-skycms-behind-reverse-proxy
audience:
  - Developers
  - Administrators
  - DevOps
difficulty: intermediate
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# Proxy Settings

## Summary

Use this guide when SkyCMS is deployed behind a reverse proxy, ingress controller, or edge gateway.

## Outcome

After completing this page, forwarded headers, URL generation, redirects, and tenant mapping should behave correctly in proxied environments.

## Common proxy requirements

- preserve host and scheme headers,
- forward client IP headers,
- enforce HTTPS forwarding behavior,
- keep origin and proxy path assumptions consistent.

## Configuration checks

1. Confirm forwarded headers are enabled correctly.
2. Verify generated URLs use expected host and scheme.
3. Validate authentication callbacks and redirects behind proxy.
4. Confirm tenant and domain resolution behavior remains correct.

## Troubleshooting

If redirect scheme is wrong:

- verify forwarded proto handling and HTTPS forwarding config.

If links show wrong host:

- verify forwarded host header behavior and trusted proxy settings.

If tenant/domain resolution is incorrect:

- verify canonical host forwarding and tenant header/path assumptions.

## Related guides

- [Configuration Overview](./overview.md)
- [Multi-Tenancy Configuration](./multi-tenancy.md)
- [Troubleshooting](../reference/troubleshooting.md)
