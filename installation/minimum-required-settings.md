---
canonical_title: Minimum Required Settings
description: Reference the minimum SkyCMS settings required to start setup and complete a first successful publish.
doc_type: Reference
product_area: installation
user_intent: find-minimum-settings-required-to-start-skycms
audience:
	- Developers
	- DevOps
difficulty: beginner
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# Minimum Required Settings

## Summary

Use this reference when preparing any SkyCMS deployment before running setup.

## Required settings

- `ConnectionStrings__ApplicationDbContextConnection`
- `ConnectionStrings__StorageConnectionString`
- `AzureBlobStorageEndPoint`
- `CosmosPublisherUrl`
- `CosmosAllowSetup` (true for initial setup only)

## Environment variable example

```powershell
$env:ConnectionStrings__ApplicationDbContextConnection = "Data Source=D:\\data\\cosmoscms.db"
$env:ConnectionStrings__StorageConnectionString = "Bucket=my-bucket;Region=us-east-1;KeyId=...;Key=...;"
$env:AzureBlobStorageEndPoint = "/"
$env:CosmosPublisherUrl = "https://www.example.com"
$env:CosmosAllowSetup = "true"
```

## Connection string formats

### Azure Blob

```text
DefaultEndpointsProtocol=https;AccountName=<name>;AccountKey=<key>;EndpointSuffix=core.windows.net;
```

### Amazon S3

```text
Bucket=<bucket>;Region=<region>;KeyId=<access-key-id>;Key=<secret-access-key>;
```

### Cloudflare R2

```text
AccountId=<account-id>;Bucket=<bucket>;AccessKeyId=<access-key-id>;SecretAccessKey=<secret-access-key>;
```

## Single-tenant vs multi-tenant

- Setup wizard is designed for single-tenant initialization.
- Multi-tenant deployments should use centralized tenant configuration and disable setup after initialization.

See [Multi-Tenancy Configuration](../configuration/multi-tenancy.md).

## Validation checklist

- the app starts without configuration exceptions,
- `/___setup` is reachable when `CosmosAllowSetup=true`,
- the storage connection test succeeds in step 1,
- admin creation succeeds in step 2,
- the first publish succeeds after setup.

## Related guides

- [Installation Overview](overview.md)
- [Setup Wizard](setup-wizard.md)
- [Post-Installation Configuration](post-installation.md)
- [Storage Overview](../configuration/storage/overview.md)
