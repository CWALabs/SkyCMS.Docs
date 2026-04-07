# Multi-Tenancy & Architecture

SkyCMS is designed as a multi-tenant platform from the ground up. A single deployment can serve multiple independent websites, each with its own content, users, storage, database, and configuration — while sharing the same application infrastructure.

**Audiences:** Developers, Administrators, Evaluators

**Jump to:**

- [Multi-Tenancy Model](#1-multi-tenancy-model)
- [Tenant Isolation](#2-tenant-isolation)
- [Multi-Database Support (FlexDb)](#3-multi-database-support-flexdb)
- [Configuration System](#4-configuration-system)
- [Application Architecture](#5-application-architecture)
- [Publisher Architecture](#6-publisher-architecture)
- [Entity Framework Integration](#7-entity-framework-integration)

---

## 1. Multi-Tenancy Model

> **Documentation:** [Multi-Tenancy Configuration](../../configuration/multi-tenancy.md) · [Multi-Tenancy Deep Dive (Developers)](../../for-developers/multi-tenancy-deep-dive.md)

### Single Instance, Multiple Sites

- One deployed application serves all tenants
- Each tenant is an independent website with its own domain
- Tenants share application code but have isolated data
- No per-tenant deployment required — add tenants via configuration

### Tenant Resolution

Tenants are identified on every HTTP request via domain headers:

1. **`x-origin-hostname`** header (highest priority) — used when behind a CDN or reverse proxy
2. **`Host`** header (fallback) — standard HTTP host detection

Resolution happens early in the middleware pipeline via `DomainMiddleware`, before any controller code executes.

### Tenant Context

- `IDynamicConfigurationProvider` (singleton) resolves the current tenant
- Per-request scoped services receive tenant context automatically
- `TenantContext` holds the resolved tenant for the current request
- All data access is automatically filtered to the current tenant

---

## 2. Tenant Isolation

> **Documentation:** [Tenant Isolation Reference](../../for-developers/tenant-isolation-reference.md) · [Multi-Tenancy Deep Dive](../../for-developers/multi-tenancy-deep-dive.md)

### Data Isolation

| Layer | Isolation Mechanism |
|-------|-------------------|
| **Content** | Pages, articles, media scoped to tenant via `IApplicationDbContext` |
| **Settings** | Settings queries filtered by tenant domain |
| **Users** | Per-tenant user stores and roles |
| **Files** | Per-tenant cloud storage paths |
| **Cache** | Cache key prefixing by tenant domain |
| **Cookies** | `CookieDomain` claim controls session scope (Sky.Editor) |
| **CDN** | Publish and cache purge affect only the tenant's assets |
| **Configuration** | Per-tenant configuration records in `DynamicConfigDbContext` |

### Cookie Isolation

- Cookie domain controlled via `CookieDomain` claim in the user's identity
- Prevents session leakage between tenants sharing the same application
- Automatically scoped per HttpContext

### Anti-Forgery Isolation

- Anti-forgery tokens are automatically scoped per HttpContext
- Each tenant gets its own token validation scope

---

## 3. Multi-Database Support (FlexDb)

> **Documentation:** [FlexDb (Developers)](../../for-developers/extending/flex-db.md) · [Database Overview](../../configuration/database/overview.md) · [Cosmos DB](../../configuration/database/cosmos-db.md) · [SQL Server](../../configuration/database/sql-server.md) · [MySQL](../../configuration/database/mysql.md) · [SQLite](../../configuration/database/sqlite.md) · [Database Configuration Reference](../../configuration/database/configuration-reference.md)

### AspNetCore.Identity.FlexDb

SkyCMS identity storage uses a flexible database provider system that auto-selects the database engine from the connection string — no code changes needed.

### Supported Database Providers

| Provider | Priority | Best For |
|----------|----------|----------|
| **Azure Cosmos DB** | 10 (highest) | Global scale, NoSQL, multi-region replication |
| **SQL Server / Azure SQL** | 20 | Enterprise ACID compliance, complex queries |
| **MySQL** | 30 | Open-source relational database |
| **SQLite** | 40 (lowest) | Local development, single-server deployments, demos |

### Provider Selection

- **Automatic** — Provider detected from connection string format at runtime
- **Strategy pattern** — Each provider implements a detection strategy with priority ordering
- **Zero code changes** — Switch databases by changing the connection string only
- **Multi-environment** — Use different providers per environment (e.g., SQLite in dev, Cosmos in production)

### Provider Features

- Thread-safe concurrent operations across all providers
- Personal data protection (encryption) for sensitive user fields
- Backward compatibility with legacy Cosmos DB configurations
- Database schema auto-initialization on first startup

---

## 4. Configuration System

> **Documentation:** [Configuration Overview](../../configuration/overview.md) · [Multi-Tenancy Configuration](../../configuration/multi-tenancy.md) · [Proxy Settings](../../configuration/proxy-settings.md)

### Dynamic Configuration Provider

- Runtime configuration resolution without app restart
- Per-tenant configuration records stored in `DynamicConfigDbContext`
- Domain-to-tenant mapping
- Configuration cached with 10-second TTL for performance
- Domain name validation API (`ValidateDomainName()`)
- Metrics collection per tenant (usage tracking)

### Configuration Precedence

Settings are resolved in order (highest priority first):

1. Environment variables and secret stores
2. Environment-specific `appsettings.{Environment}.json`
3. Base `appsettings.json` defaults
4. Dynamic configuration records (per-tenant overrides)

### Configurable Categories

- Database connection strings
- Cloud storage connection strings
- CDN provider settings
- Email provider settings
- Multi-tenancy domain mappings
- Proxy settings (for reverse proxies and CDNs)
- Copilot AI endpoint settings

---

## 5. Application Architecture

> **Documentation:** [Architecture (Developers)](../../for-developers/architecture.md) · [Middleware Pipeline](../../for-developers/middleware-pipeline.md)

### CQRS + Mediator Pattern

Content operations use a vertical-slice architecture with MediatR:

- **Commands** — Create, Save, Delete, Publish, Trash, Restore, Clone, Import, Promote
- **Queries** — Get, GetList, GetEditable, GetSettings
- **Handlers** — Each command/query has a dedicated handler
- **Results** — Standardized result objects with `IsSuccess` and error messages

Feature slices organized by domain:

- `Features/Articles/` — Article CRUD, versioning, publishing
- `Features/Blogs/` — Blog stream and post management
- `Features/Layouts/` — Layout creation, import, promotion
- `Features/Templates/` — Template CRUD, publishing, metadata
- `Features/Copilot/` — AI proxy configuration
- `Features/Shared/` — Multi-tenant mediator wrapper

### Multi-Tenant Mediator

- `MultiTenantMediator` wraps MediatR to inject tenant context into every command/query
- Ensures all operations are automatically tenant-scoped

### Real-Time Communication (SignalR)

Three SignalR hubs for real-time features:

| Hub | Purpose | Authorization |
|-----|---------|--------------|
| **ChatHub** | Editor chat, article locking, save notifications, typing indicators | Authenticated users |
| **LiveEditorHub** | Multi-user editing groups, live content updates, editor presence | Authenticated users |
| **PublishingProgressHub** | Bulk publish progress streaming | Editors, Administrators |

### Middleware Pipeline

Key middleware in execution order:

1. `DomainMiddleware` — Tenant resolution (earliest)
2. `TenantSetupMiddleware` — Redirect to setup if tenant not initialized
3. `SetupCompletionFilter` — Endpoint filter for setup verification
4. Standard ASP.NET Core middleware (auth, CORS, rate limiting, anti-forgery)
5. Controller dispatch

### Boot Modules

Two boot paths depending on deployment mode:

- **`SingleTenant.Configure()`** — DI registration and schema initialization for single-tenant deployments
- **`MultiTenant.Configure()`** — DI registration, schema initialization, and dynamic config wiring for multi-tenant deployments

---

## 6. Publisher Architecture

> **Documentation:** [Publisher Architecture](../../for-developers/publisher-architecture.md) · [Publishing Workflow](../../deployment/publishing-workflow.md)

The Publisher (public-facing site) operates in two modes:

### Dynamic Publisher Mode

- Full server-side HTML rendering from database
- Real-time content from `ApplicationDbContext`
- Authentication support (OAuth, Azure B2C)
- SEO-optimized meta tags and structured data

### Static Website Proxy Mode

- Pre-rendered HTML files served from cloud storage
- Minimal server overhead — pages served from CDN edge
- SPA fallback routing for single-page applications
- Maximum performance for high-traffic sites

### Publisher Services

| Service | Purpose |
|---------|---------|
| `ViewRenderingService` | Render Razor views to HTML strings |
| `IPublishingService` | Orchestrate publish operations |
| `IPublishingProgressReporter` | Track and report publish progress |
| `ICdnServiceFactory` | CDN provider factory (Azure, Cloudflare, CloudFront, Sucuri) |
| `AzureWebAppPublisher` | Azure App Service deployment |
| `GraphIntegrationService` | Microsoft Graph for AD group authorization |
| `RequestContextProvider` | Resolve request context for content delivery |

---

## 7. Entity Framework Integration

> **Documentation:** [EF Cross-Provider Compatibility Guide](../../for-developers/ef-cross-provider-guide.md) · [FlexDb](../../for-developers/extending/flex-db.md) · [Database Overview](../../configuration/database/overview.md)

### Cross-Provider Compatibility

All EF Core queries are designed to work across all four supported database providers:

- No cross-container joins (Cosmos DB limitation)
- No inline casts in expression trees (Cosmos DB limitation)
- Sequential queries with client-side correlation instead of joins
- Pre-computed values for enum conversions before LINQ predicates

### Database Contexts

| Context | Purpose |
|---------|---------|
| `ApplicationDbContext` | Main content storage (articles, templates, layouts, blogs, contacts) |
| `DynamicConfigDbContext` | Tenant configuration and domain mappings |
| `CosmosIdentityDbContext` | ASP.NET Core Identity storage (users, roles, claims) |
