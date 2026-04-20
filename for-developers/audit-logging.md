# Audit & Logging

SkyCMS uses structured logging, domain events, and a dedicated setup audit log to provide visibility into system activity. Health check endpoints support uptime monitoring.

**Audience:** Developers, Administrators

---

## Domain Events

SkyCMS implements a domain event system to decouple side-effects from primary actions. Events are dispatched via MediatR and handled by one or more event handlers.

### Event Types

| Event | Trigger | Purpose |
|-------|---------|---------|
| **ArticlePublishedEvent** | Page/article is published | Notifies downstream systems that content is live |
| **TitleChangedEvent** | Page title is modified | Triggers redirect creation, cache invalidation |
| **RedirectCreatedEvent** | URL redirect is added or modified | Logs redirect changes, invalidates related caches |
| **CatalogUpdatedEvent** | Site catalog/navigation is rebuilt | Triggers cache refresh for navigation structures |

### Event Handlers

Each event is processed by specialized handlers:

| Handler | Responsibility |
|---------|----------------|
| **ArticlePublishedEventHandler** | Post-publish processing (e.g., regenerating static content, notifications) |
| **TitleChangedEventHandler** | Automatically creates redirects from old URLs to new URLs |
| **RedirectCreatedEventHandler** | Logs and processes new redirect entries |
| **CatalogUpdatedEventHandler** | Refreshes cached navigation and sitemap structures |
| **CacheInvalidationHandler** | Cross-cutting handler that purges affected cache entries |
| **CompositeLoggingEventHandler&lt;T&gt;** | Generic logging handler that records any domain event to structured logs |

### Adding Custom Event Handlers

To respond to an existing domain event:

1. Create a class implementing `INotificationHandler<TEvent>`.
2. Register it in the DI container (MediatR auto-discovers handlers in the assembly).
3. The handler will be called alongside existing handlers when the event is published.

Events are defined in `Editor/Domain/Events/` and handlers in the corresponding `Handlers/` namespace.

---

## Setup Audit Log

The system records a structured audit trail for administrative setup operations. This is important for tracking who configured the system and what changes were made.

### Audit Record Structure

| Field | Type | Description |
|-------|------|-------------|
| **SessionId** | string | Groups related changes from the same setup session |
| **Timestamp** | DateTime | When the change occurred (UTC) |
| **InitiatedBy** | string | Username or system identity that made the change |
| **Description** | string | Human-readable summary of the operation |
| **Changes** | Dictionary&lt;string, string&gt; | Key-value pairs of changed settings |
| **IsInitialSetup** | bool | Whether this was the first-time system setup |

### Storage

Audit records are persisted in the **Settings** table with `Group = "SETUP"`. This reuses the existing settings infrastructure without requiring a separate table.

### Security

- Sensitive field values (e.g., connection strings, API keys) are masked before storage.
- Audit records are write-only from the setup flow — there is no UI for viewing them yet.

> **Note:** A planned enhancement (tracked as a TODO in `SetupAuditLog.cs`) is to create a UI viewer for audit log records.

---

## Health Checks

SkyCMS exposes health check endpoints for monitoring and orchestration.

### Endpoints

| Endpoint | Component | Description |
|----------|-----------|-------------|
| `/healthz` | Publisher / Static proxy | Returns `200 OK` when the publisher is running |
| `/__healthz` | Editor (setup) | Internal health endpoint for the editor application |
| `/healthz` | Editor (runtime) | Standard health endpoint after setup is complete |

### Middleware Behavior

Health check paths are excluded from domain resolution middleware (`DomainMiddleware`). This ensures health probes succeed even before tenant context is established — important for container orchestrators (Docker, Kubernetes) and load balancers.

### Integration

- **Docker Compose**: Health check configured in `docker-compose.yml` using the `/healthz` endpoint.
- **Azure App Service**: Use `/healthz` as the health probe path.
- **Kubernetes**: Configure liveness and readiness probes to the appropriate endpoint.

---

## Structured Logging

All controllers and services use `ILogger<T>` for structured logging. Log entries include:

- **Correlation IDs** via ASP.NET Core's built-in request tracking.
- **Tenant context** when running in multi-tenant mode.
- **User identity** for authenticated actions.

### Configuration

Logging levels and sinks are configured via standard ASP.NET Core logging configuration in `appsettings.json`:

```json
{
  "Logging": {
    "LogLevel": {
      "Default": "Information",
      "Microsoft.AspNetCore": "Warning"
    }
  }
}
```

External logging providers (Application Insights, Seq, Serilog, etc.) can be added via the standard ASP.NET Core logging pipeline.

---

## See Also

- [Blog Architecture](blog-architecture.md) — Domain events in the blogging subsystem
- [Site Settings](../for-editors/site-settings.md) — Settings that are subject to audit logging
- [Installation Guide](../installation/overview.md) — Health check configuration during deployment
