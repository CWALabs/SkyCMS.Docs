<!-- Audience: Developers and DevOps -->
<!-- Type: How-to -->
<!-- Status: Draft -->
<!-- Source: SkyCMS/Docs/Configuration/Database-CosmosDB.md -->

# Database: Azure Cosmos DB

## When to use Cosmos DB

Use Cosmos DB when you need elastic scale, low-latency global distribution, and document-oriented storage patterns.

## Data modeling guidance

- design for partition-aware access patterns,
- avoid hot partitions by choosing high-cardinality partition keys,
- prefer data shapes that minimize cross-partition query cost.

## Required settings

Use `ConnectionStrings:ApplicationDbContextConnection` with:

`AccountEndpoint`, `AccountKey`, and `Database` values.

## Partitioning and throughput

Recommended practices:

- pick partition keys aligned to dominant query paths,
- monitor RU consumption and tune throughput based on workload,
- capture diagnostics for high-latency or unexpected status responses.

## Diagnostics and troubleshooting

- startup failure: verify endpoint/key/database name,
- high RU usage: inspect query patterns and partition distribution,
- throttling (`429`): use retry strategy and review throughput settings.

## Related guides

- [Database Overview](./overview.md)
- [Database Configuration Reference](./configuration-reference.md)
