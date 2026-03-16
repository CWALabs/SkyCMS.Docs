<!-- Audience: Developers and DevOps -->
<!-- Type: How-to -->
<!-- Status: Draft -->
<!-- Source: SkyCMS/Docs/Configuration/Database-SQLServer.md -->

# Database: SQL Server

## When to use SQL Server

Use SQL Server (or Azure SQL) for enterprise-grade relational features, mature tooling, and straightforward operational workflows.

## Required settings

Set `ConnectionStrings:ApplicationDbContextConnection` with server, database, and authentication values.

## Example configuration

Examples:

- local trusted connection,
- Azure SQL with `Encrypt=True` and explicit credentials.

## Connection troubleshooting

- authentication errors: validate user/password or integrated auth context,
- certificate issues in development: review trust/certificate settings,
- network issues: verify firewall and SQL endpoint access.

## Related guides

- [Database Overview](./overview.md)
- [Database Configuration Reference](./configuration-reference.md)
