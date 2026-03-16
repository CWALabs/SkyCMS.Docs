<!-- Audience: Developers and Administrators -->
<!-- Type: Reference -->
<!-- Status: Draft -->
<!-- Source: SkyCMS/Docs/Configuration/Database-Configuration-Reference.md -->

# Database Configuration Reference

## Configuration key

`ConnectionStrings:ApplicationDbContextConnection`

## Connection string patterns

### Cosmos DB

`AccountEndpoint=...;AccountKey=...;Database=...;`

### SQL Server/Azure SQL

`Server=...;Database=...;User ID=...;Password=...;`

### MySQL

`Server=...;Port=3306;Uid=...;Pwd=...;Database=...;`

### SQLite

`Data Source=skycms.db`

## Security guidance

- keep credentials in environment variables or secret stores,
- avoid committing secrets into source control,
- rotate keys and passwords regularly.

## Related guides

- [Database Overview](./overview.md)
