# Tenant Isolation Reference

This reference documents how SkyCMS isolates data, caches, cookies, blob storage, and CDN operations between tenants in a multi-tenant deployment.

**Audience:** Developers, Administrators

---

## Isolation Summary

| Layer | Isolation Mechanism |
|-------|-------------------|
| **Database** | EF Core query filters on tenant domain, captured at DbContext instantiation |
| **Cache** | Tenant-prefixed cache keys (`TENANT_CACHE::{domain}::{key}`) |
| **Cookies** | `CookieDomain` claim validation — mismatched domains trigger sign-out |
| **Blob storage** | Tenant-specific connection strings and path prefixes |
| **CDN** | Per-tenant CDN configuration; purge operations scoped to tenant |
| **Request context** | `DomainMiddleware` establishes tenant before routing |

---

## Tenant Resolution

### IDynamicConfigurationProvider

The `IDynamicConfigurationProvider` (registered as a **singleton**) is the central service for tenant resolution. It provides:

- `GetTenantDomainNameFromRequest()` — Extracts the current tenant domain from the HTTP context.
- `GetDatabaseConnectionStringAsync(domain)` — Retrieves the tenant's database connection string.
- `GetStorageConnectionStringAsync(domain)` — Retrieves the tenant's blob storage connection string.

**Header priority:**

1. `x-origin-hostname` header (used when behind a reverse proxy or CDN)
2. `Host` header (standard fallback)

In single-tenant deployments, the `SingleTenantConfigurationProvider` is used instead.

### DomainMiddleware

Registered early in the middleware pipeline, `DomainMiddleware`:

1. Extracts the domain from the request host (lowercased).
2. Validates the domain by checking for a database connection string via `IDynamicConfigurationProvider`.
3. Stores the domain in `HttpContext.Items["Domain"]` for downstream access.
4. Returns **404** if the domain is not recognized — preventing unauthorized tenant access.

> **Health check paths** (`/healthz`, `/__healthz`) are excluded from domain validation, ensuring container orchestrators can probe the application without tenant context.

---

## Database Isolation

### Query Filters

`ApplicationDbContext` captures the tenant domain once at instantiation:

```csharp
CurrentTenantDomain = configurationProvider?.GetTenantDomainNameFromRequest();
```

All entity queries are automatically filtered by this domain via EF Core global query filters. This means:

- No tenant can accidentally read another tenant's data.
- The filter is applied at the database provider level — it works across SQL Server, MySQL, SQLite, and Cosmos DB.
- The domain is captured once per request to prevent mid-request tenant confusion.

### Per-Tenant Connection Strings

In multi-tenant mode, each tenant can have its own database connection string. The `IDynamicConfigurationProvider` resolves the correct connection string per request.

---

## Cache Isolation

`CacheService<T>` injects `IDynamicConfigurationProvider` and prefixes all cache keys with the tenant domain:

```
TENANT_CACHE::{tenant-domain}::{cache-key}
```

For example, tenant `site-a.com` caching article redirects produces the key:

```
TENANT_CACHE::site-a.com::ArticleRedirects
```

All cache operations (`Get`, `TryGet`, `Set`, `Remove`) use this scoped key. If no tenant is resolved (e.g., during startup), the key is used without a prefix.

---

## Cookie Isolation

SkyCMS uses a claims-based approach to cookie isolation:

1. On login, the current tenant domain is stored as a `CookieDomain` claim in the user's identity.
2. On each subsequent request, the `OnValidatePrincipal` event compares the `CookieDomain` claim to the current request domain.
3. If the domains don't match, the user is **signed out** — preventing session fixation across tenants.

Cookie security settings:

| Setting | Value |
|---------|-------|
| **SameSite** | Lax |
| **SecurePolicy** | Always (HTTPS) |
| **HttpOnly** | true |
| **Domain** | Not set globally (defaults to request host) |

---

## Blob Storage Isolation

`StorageContext` is registered as a **scoped service** and retrieves tenant-specific storage connection strings at runtime:

- When `MultiTenantEditor` is `true`, each request gets the tenant's storage connection via `IDynamicConfigurationProvider`.
- Blob storage paths are prefixed with the tenant domain.
- File uploads, static page generation, and asset delivery all use the tenant-scoped storage context.

---

## CDN Isolation

Each tenant can configure its own CDN provider and credentials:

- CDN settings are stored per tenant in the settings table.
- Purge operations target only the tenant's CDN configuration.
- CDN purge failures do not block publishing — they only affect cache freshness.
- Supported providers: Cloudflare, Azure CDN/Front Door, CloudFront, Sucuri.

---

## Testing

Multi-tenant isolation is validated by integration tests:

- `MultiTenantIntegrationTests` creates isolated test contexts per tenant domain.
- Tests verify that articles created in one tenant are not visible in another.
- Published content isolation is verified separately from draft content.

---

## See Also

- [Multi-Tenancy Configuration](../../configuration/multi-tenancy.md) — Setup guide
- [Multi-Tenancy Deep Dive](multi-tenancy-deep-dive.md) — Architecture overview
- [Publisher Architecture](publisher-architecture.md) — How the publisher handles multi-tenancy
- [EF Cross-Provider Guide](ef-cross-provider-guide.md) — Database compatibility
