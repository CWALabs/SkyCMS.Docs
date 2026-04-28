---
canonical_title: Database: SQLite
description: Configure SkyCMS to use SQLite for local development, demos, and lightweight single-instance environments.
doc_type: How-to
product_area: configuration
user_intent: configure-skycms-sqlite-database
audience:
	- Developers
difficulty: beginner
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# Database: SQLite

## Summary

Use SQLite for local development, demos, and lightweight single-instance environments.

## Outcome

After completing this guide, SkyCMS will connect to the configured SQLite database file and use it for local development or demo workloads.

## Required settings

Set `ConnectionStrings:ApplicationDbContextConnection` to a file-based data source.

## Example configuration

Example:

`Data Source=skycms.db`

## Validation checklist

- application can create or open the database file,
- sign-in and content save work locally,
- file permissions allow write access,
- no multi-instance write pattern is introduced.

## Known limitations

- file permission failures: verify app write access to database path,
- locking issues: avoid shared or multi-instance write scenarios,
- production scaling constraints: move to SQL Server, MySQL, or Cosmos DB for distributed deployments.

## Related guides

- [Database Overview](./overview.md)
- [Database Configuration Reference](./configuration-reference.md)
