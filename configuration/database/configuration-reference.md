<!-- Audience: Developers and Administrators -->
<!-- Type: Reference -->
<!-- Status: Draft -->
<!-- Source: SkyCMS/Docs/Configuration/Database-Configuration-Reference.md -->

# Database Configuration Reference

## Configuration key

`ConnectionStrings:ApplicationDbContextConnection`

SkyCMS uses this connection string to auto-detect the database provider. You do not set a separate `DatabaseProvider` flag.

## Connection string patterns

### Cosmos DB

`AccountEndpoint=...;AccountKey=...;Database=...;`

### SQL Server/Azure SQL

`Server=...;Database=...;User ID=...;Password=...;`

### MySQL

`Server=...;Port=3306;Uid=...;Pwd=...;Database=...;`

### SQLite

`Data Source=skycms.db`

## Provider auto-detection

SkyCMS selects the provider by evaluating the configured connection string against known provider patterns.

| Provider | Typical pattern | Notes |
|----------|-----------------|-------|
| Cosmos DB | `AccountEndpoint=...;AccountKey=...;Database=...;` | Best for globally distributed NoSQL deployments |
| SQL Server / Azure SQL | `Server=...;Database=...;User ID=...;Password=...;` | Used for SQL Server and Azure SQL Database |
| MySQL | `Server=...;Port=3306;Uid=...;Pwd=...;Database=...;` | Open-source relational option |
| SQLite | `Data Source=...` | Common for local development and demos |

If the connection string does not match a supported provider shape, startup or database initialization will fail until the connection string is corrected.

For a deeper explanation of the strategy-based detection model and where it is implemented in code, see [EF Cross-Provider Compatibility Guide](../../for-developers/ef-cross-provider-guide.md).

## Security guidance

- keep credentials in environment variables or secret stores,
- avoid committing secrets into source control,
- rotate keys and passwords regularly.

## Related guides

- [Database Overview](./overview.md)
- [EF Cross-Provider Compatibility Guide](../../for-developers/ef-cross-provider-guide.md)
