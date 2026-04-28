---
canonical_title: Extending FlexDb
description: Extend FlexDb when the built-in provider strategies are not enough for your application.
doc_type: Reference
product_area: development
user_intent: understand-extending-flexdb
audience:
  - Backend Developers
difficulty: intermediate
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-28
---

# Extending FlexDb

## Summary

Extend FlexDb when the built-in provider strategies are not enough for your application.

## When to extend FlexDb

Common reasons include:

- adding support for another EF Core provider,
- tightening or overriding provider detection rules,
- applying provider-specific EF options during configuration,
- reusing FlexDb detection logic in custom setup or diagnostics.

If you only need to know which provider a connection string maps to, use the existing inference helpers before writing new detection logic.

## Where provider detection happens

FlexDb uses a strategy-based detection pipeline.

- `CosmosDbOptionsBuilder.ConfigureDbOptions(...)` is the main entry point.
- `CosmosDbOptionsBuilder.GetDefaultStrategies()` returns the built-in strategies.
- Each `IDatabaseConfigurationStrategy` implements `CanHandle(...)`, `Configure(...)`, `ProviderName`, and `Priority`.
- Strategies are ordered by ascending priority, and the first matching strategy wins.

This means provider selection is based on connection-string shape, not on an explicit provider flag.

## Built-in strategies

The built-in detection order is currently:

| Priority | Strategy | Typical match |
| -------- | -------- | ------------- |
| `10` | Cosmos DB | `AccountEndpoint=...;AccountKey=...;Database=...;` |
| `20` | SQL Server | `Server=...;Database=...;...` |
| `30` | MySQL | `Server=...;Port=3306;Uid=...;Pwd=...;...` |
| `40` | SQLite | `Data Source=...` |

If none of the strategies match, FlexDb throws an error instead of silently selecting a provider.

## Extension patterns

The supported extension point is custom strategy composition.

Implement `IDatabaseConfigurationStrategy` when you need a new provider or a custom matching rule, then pass your strategy set to the overload of `CosmosDbOptionsBuilder.ConfigureDbOptions(...)` that accepts `IEnumerable<IDatabaseConfigurationStrategy>`.

Recommended approach:

1. Start with `CosmosDbOptionsBuilder.GetDefaultStrategies()`.
2. Add your custom strategy.
3. Choose a priority that avoids accidental overlap.
4. Pass the combined strategy list explicitly when configuring your `DbContextOptionsBuilder`.

If you need provider information outside EF configuration, prefer `Utilities.InferDatabaseProvider(...)` or `Utilities.InferDatabaseProviderShortName(...)` rather than duplicating ad hoc substring checks elsewhere in the application.

## Safety considerations

Keep custom strategies narrow and predictable.

- `CanHandle(...)` should only inspect the connection string and should not open network connections.
- Avoid broad substring matches that can classify other providers incorrectly.
- Prefer provider-specific markers over generic SQL fragments.
- Treat priority as part of the behavior contract. A lower number means earlier evaluation.
- Keep strategies stateless so they remain safe under concurrent startup and test execution.

In SkyCMS specifically, avoid introducing provider checks in application code that bypass the FlexDb strategy system. If non-EF code needs provider classification, use the FlexDb inference helpers so behavior stays aligned with the actual configuration pipeline.

## Testing extensions

Every custom or modified strategy should have both focused unit tests and at least one integration path.

At minimum, add tests for:

- a connection string that should match your strategy,
- nearby connection strings that should not match,
- priority ordering when multiple strategies could match,
- unsupported connection strings,
- end-to-end `DbContextOptionsBuilder` configuration.

The existing FlexDb tests already cover core inference and priority behavior, so they are the best starting point when adding new provider logic.

## Practical debugging sequence

When FlexDb appears to choose the wrong provider, inspect the flow in this order:

1. Confirm the exact connection string value reaching `ConfigureDbOptions(...)`.
2. Check which built-in or custom strategies are present.
3. Order them by `Priority`.
4. Evaluate which `CanHandle(...)` method matches first.
5. If application code separately branches on provider type, make sure it uses `Utilities.InferDatabaseProviderShortName(...)` instead of its own string parsing.

## Related guides

- [EF Cross-Provider Compatibility Guide](../ef-cross-provider-guide.md)
- [Database Overview](../../configuration/database/overview.md)
- [Database Configuration Reference](../../configuration/database/configuration-reference.md)

For package-level source links and implementation notes, see the FlexDb README in the main SkyCMS solution.

