---
canonical_title: Database: MySQL
description: Configure SkyCMS to use MySQL for relational persistence in MySQL-centric environments.
doc_type: How-to
product_area: configuration
user_intent: configure-skycms-mysql-database
audience:
	- Developers
	- DevOps
difficulty: intermediate
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# Database: MySQL

## Summary

Use MySQL when your team or hosting platform is MySQL-centric and you want relational persistence for SkyCMS workloads.

## Outcome

After completing this guide, SkyCMS will connect to MySQL and use it as the primary relational data store.

## Steps

1. Set `ConnectionStrings__ApplicationDbContextConnection` in `appsettings.json` or as an environment variable using the Server, Port, Uid, Pwd, and Database values.
2. Start or restart SkyCMS to apply the configuration.
3. Complete the setup wizard if this is a fresh installation.
4. Verify the connection using the checklist below.

## Required settings

Set `ConnectionStrings:ApplicationDbContextConnection` with server, port, user, password, and database.

## Example configuration

Example:

`Server=my-host;Port=3306;Uid=my-user;Pwd=my-password;Database=SkyCMS;`

## Validation checklist

- application starts without provider mismatch errors,
- credentials and grants allow normal read/write behavior,
- sign-in and publish operations succeed,
- host, port, and TLS settings match provider requirements.

## Connection troubleshooting

- login failures: verify credentials and user grants,
- SSL or connection failures: validate host, port, and TLS requirements,
- startup provider mismatch: confirm connection string format is MySQL.

## Related guides

- [Database Overview](./overview.md)
- [Database Configuration Reference](./configuration-reference.md)
