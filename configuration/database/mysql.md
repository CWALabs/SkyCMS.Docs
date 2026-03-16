<!-- Audience: Developers and DevOps -->
<!-- Type: How-to -->
<!-- Status: Draft -->
<!-- Source: SkyCMS/Docs/Configuration/Database-MySQL.md -->

# Database: MySQL

## When to use MySQL

Use MySQL when your team or hosting platform is MySQL-centric and you want relational persistence for SkyCMS workloads.

## Required settings

Set `ConnectionStrings:ApplicationDbContextConnection` with server, port, user, password, and database.

## Example configuration

Example:

`Server=my-host;Port=3306;Uid=my-user;Pwd=my-password;Database=SkyCMS;`

## Connection troubleshooting

- login failures: verify credentials and user grants,
- SSL/connection failures: validate host, port, and TLS requirements,
- startup provider mismatch: confirm connection string format is MySQL.

## Related guides

- [Database Overview](./overview.md)
- [Database Configuration Reference](./configuration-reference.md)
