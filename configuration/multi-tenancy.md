<!-- Audience: Developers and Administrators -->
<!-- Type: How-to -->
<!-- Status: Draft -->
<!-- Source: SkyCMS/Docs/Configuration/Multi-Tenant-Configuration.md -->

# Multi-Tenancy Configuration

## When to use this page

Use this guide when you need to:

- enable tenant-aware behavior by domain,
- map hostnames to tenant configuration,
- validate data and content isolation across tenants.

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
- content/settings do not leak between tenants,
- publish and cache purge actions affect only intended tenant assets.

## Troubleshooting

- wrong content by domain: verify domain-to-tenant mapping and proxy forwarding headers,
- shared settings unexpectedly: verify tenant key usage in configuration queries,
- publish affecting another tenant: verify isolation in publish and storage paths.

## Related guides

- [Configuration Overview](./overview.md)
- [Proxy Settings](./proxy-settings.md)
