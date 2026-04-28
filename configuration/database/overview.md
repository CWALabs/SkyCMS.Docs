---
canonical_title: Database Overview
description: Choose a SkyCMS database provider and configure connection settings for reliable startup and publishing.
doc_type: Explanation
product_area: configuration
user_intent: choose-and-configure-skycms-database
audience:
  - Developers
  - Administrators
  - DevOps
difficulty: beginner
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# Database Overview

## Summary

SkyCMS supports multiple database providers and selects behavior from your configured connection settings.

Use this page to choose the right provider and follow the safest setup order.

## Supported providers

- Azure Cosmos DB
- SQL Server or Azure SQL
- MySQL
- SQLite (primarily for local and demo scenarios)

## Provider selection guidance

| Scenario | Recommended provider |
| --- | --- |
| Production managed relational workloads | SQL Server or Azure SQL |
| Existing MySQL operations footprint | MySQL |
| Cloud-native NoSQL pattern with Cosmos alignment | Azure Cosmos DB |
| Local development and quick demos | SQLite |

## Configuration model

Primary key:

- `ConnectionStrings:ApplicationDbContextConnection`

SkyCMS uses provider inference from connection string characteristics, so a separate provider flag is generally not required for the primary database path.

## Setup sequence

1. Select provider based on operations model and team expertise.
2. Configure application database connection string.
3. Validate startup and connectivity.
4. Run first sign-in and first publish verification.

## Validation checklist

- the app starts with no provider configuration errors,
- authentication and identity operations succeed,
- content save and publish operations succeed,
- logs show no persistent database connectivity failures.

## Related guides

- [Database Configuration Reference](./configuration-reference.md)
- [Azure Cosmos DB](./cosmos-db.md)
- [SQL Server](./sql-server.md)
- [MySQL](./mysql.md)
- [SQLite](./sqlite.md)
- [EF Cross-Provider Compatibility Guide](../../for-developers/ef-cross-provider-guide.md)
