---
canonical_title: Database: Azure Cosmos DB
description: Configure SkyCMS to use Azure Cosmos DB for globally distributed, document-oriented data storage.
doc_type: How-to
product_area: configuration
user_intent: configure-skycms-cosmos-db-database
audience:
	- Developers
	- DevOps
difficulty: advanced
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# Database: Azure Cosmos DB

## Summary

Use Azure Cosmos DB when you need elastic scale, low-latency global distribution, and document-oriented storage patterns.

## Outcome

After completing this guide, SkyCMS will connect to Azure Cosmos DB and use it as the primary data store for content, identity, and runtime state.

## Data modeling guidance

- design for partition-aware access patterns,
- avoid hot partitions by choosing high-cardinality partition keys,
- prefer data shapes that minimize cross-partition query cost.

## Required settings

Use `ConnectionStrings:ApplicationDbContextConnection` with `AccountEndpoint`, `AccountKey`, and `Database` values.

## Partitioning and throughput

Recommended practices:

- pick partition keys aligned to dominant query paths,
- monitor RU consumption and tune throughput based on workload,
- capture diagnostics for high-latency or unexpected status responses.

## Validation checklist

- application starts successfully with Cosmos connectivity,
- sign-in and content operations succeed,
- RU consumption remains within expected range,
- no persistent throttling or partition hot-spot behavior appears in logs.

## Diagnostics and troubleshooting

- startup failure: verify endpoint, key, and database name,
- high RU usage: inspect query patterns and partition distribution,
- throttling (`429`): use retry strategy and review throughput settings.

## Related guides

- [Database Overview](./overview.md)
- [Database Configuration Reference](./configuration-reference.md)
