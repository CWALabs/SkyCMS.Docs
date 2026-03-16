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

## Related guides

- [Database Configuration Reference](./configuration-reference.md)
- [Azure Cosmos DB](./cosmos-db.md)
- [SQL Server](./sql-server.md)
- [MySQL](./mysql.md)
- [SQLite](./sqlite.md)
