---
canonical_title: Multi-Tenancy Configuration
description: Configure tenant-aware behavior in SkyCMS using domain mapping, tenant-scoped settings, and isolation validation.
doc_type: How-to
product_area: configuration
user_intent: configure-skycms-multi-tenancy-by-domain
audience:
  - Developers
  - Administrators
difficulty: intermediate
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# Multi-Tenancy Configuration

## Summary

Use this guide when you need to:

- enable tenant-aware behavior by domain,
- map hostnames to tenant configuration,
- validate data and content isolation across tenants.

## Outcome

After completing this guide, SkyCMS will resolve tenant context from incoming domain headers, apply per-tenant configuration, and isolate content and settings across tenant boundaries.

## Tenant resolution model

SkyCMS resolves tenant context from incoming host/domain information and uses that context for settings, content access, and publishing behavior.

## Configuration precedence and request flow

```mermaid
%%{init: {"theme":"base","themeVariables":{"primaryColor":"#eef6ff","primaryTextColor":"#0f172a","primaryBorderColor":"#2563eb","lineColor":"#334155","secondaryColor":"#f8fafc","tertiaryColor":"#ffffff","fontFamily":"Segoe UI, Arial, sans-serif"}}}%%
flowchart TD
  Request[Incoming request] --> Headers{Host source}
  Headers -- x-origin-hostname --> Provider[IDynamicConfigurationProvider]
  Headers -- Host --> Provider
  Provider --> Mapping[Domain-to-tenant mapping]
  Mapping --> Config[Per-tenant configuration]
  Config --> Runtime[Database, storage, publish, and cache behavior]
  Env[Environment variables and secrets] --> Config
  AppSettings[appsettings files] --> Config
```

## Required settings

- tenant domain entries,
- per-tenant configuration records,
- provider settings valid for each tenant.

## Domain mapping

Recommended mapping approach:

1. define canonical domains per tenant,
2. map each domain to tenant configuration,
3. validate redirects and host-header behavior.

## Testing tenant isolation

Validate with at least two tenant domains:

- each domain resolves the expected tenant,
- content and settings do not leak between tenants,
- publish and cache purge actions affect only the intended tenant assets.

## Troubleshooting

- wrong content by domain: verify domain-to-tenant mapping and proxy forwarding headers,
- shared settings unexpectedly: verify tenant key usage in configuration queries,
- publish affecting another tenant: verify isolation in publish and storage paths.

## Related guides

- [Configuration Overview](./overview.md)
- [Proxy Settings](./proxy-settings.md)
- [Troubleshooting](../reference/troubleshooting.md)
