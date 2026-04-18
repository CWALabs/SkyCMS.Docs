<!-- Audience: Developers and Administrators -->
<!-- Type: Explanation -->
<!-- Status: Draft -->
<!-- Source: SkyCMS/Docs/Configuration/Database-Overview.md -->

# Database Overview

## When to use this page

Use this guide when choosing a SkyCMS database provider and planning connection-string setup.

## Supported providers

- Azure Cosmos DB,
- SQL Server/Azure SQL,
- MySQL,
- SQLite (development-focused).

## Selection guidance

- choose provider aligned to team expertise and operational model,
- use managed services for production whenever possible,
- reserve SQLite for local development and simple demos.

## Configuration key

Use `ConnectionStrings:ApplicationDbContextConnection` to configure the active provider.

## Automatic provider detection

SkyCMS does not require a separate provider flag for the main database. It inspects the configured connection string and automatically selects the matching EF Core provider at startup.

- Cosmos DB connection strings are detected from Cosmos-style account endpoint patterns.
- SQL Server and Azure SQL connection strings are detected from SQL Server connection-string patterns.
- MySQL connection strings are detected from MySQL-style server, database, and credential patterns.
- SQLite is detected from file-based data source patterns.

This behavior is implemented by the FlexDb strategy system used by SkyCMS identity and related multi-provider components.

For exact connection-string shapes, see [Database Configuration Reference](./configuration-reference.md).

For the developer-focused explanation of how provider auto-detection works in code, see [EF Cross-Provider Compatibility Guide](../../for-developers/ef-cross-provider-guide.md).

## Related guides

- [Database Configuration Reference](./configuration-reference.md)
- [Azure Cosmos DB](./cosmos-db.md)
- [SQL Server](./sql-server.md)
- [MySQL](./mysql.md)
- [SQLite](./sqlite.md)
- [EF Cross-Provider Compatibility Guide](../../for-developers/ef-cross-provider-guide.md)
