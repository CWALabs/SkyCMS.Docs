---
canonical_title: Database: SQL Server
description: Configure SkyCMS to use SQL Server or Azure SQL for relational persistence and production-ready operations.
doc_type: How-to
product_area: configuration
user_intent: configure-skycms-sql-server-database
audience:
	- Developers
	- DevOps
difficulty: intermediate
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# Database: SQL Server

## Summary

Use SQL Server or Azure SQL when you want enterprise-grade relational features, mature tooling, and straightforward operational workflows.

## Required settings

Set `ConnectionStrings:ApplicationDbContextConnection` with server, database, and authentication values.

## Example configuration

Common patterns include:

- local trusted connection,
- Azure SQL with `Encrypt=True` and explicit credentials.

## Validation checklist

- application starts successfully,
- sign-in and content save work,
- publish flow completes without database errors,
- firewall and authentication settings allow runtime connectivity.

## Connection troubleshooting

- authentication errors: validate user/password or integrated auth context,
- certificate issues in development: review trust/certificate settings,
- network issues: verify firewall and SQL endpoint access.

## Related guides

- [Database Overview](./overview.md)
- [Database Configuration Reference](./configuration-reference.md)
