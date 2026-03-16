<!-- Audience: Developers -->
<!-- Type: How-to -->
<!-- Status: Draft -->
<!-- Source: SkyCMS/Docs/Configuration/Database-SQLite.md -->

# Database: SQLite

## When to use SQLite

Use SQLite for local development, demos, and lightweight single-instance environments.

## Required settings

Set `ConnectionStrings:ApplicationDbContextConnection` to a file-based data source.

## Example configuration

Example:

`Data Source=skycms.db`

## Known limitations

- file permission failures: verify app write access to database path,
- locking issues: avoid shared/multi-instance write scenarios,
- production scaling constraints: move to SQL Server/MySQL/Cosmos for distributed deployments.

## Related guides

- [Database Overview](./overview.md)
- [Database Configuration Reference](./configuration-reference.md)
