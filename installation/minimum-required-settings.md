<!-- Audience: Developers and DevOps -->
<!-- Type: Reference -->
<!-- Status: Draft -->
<!-- Source: SkyCMS/Docs/Installation/MinimumRequiredSettings.md -->

# Minimum Required Settings

## When to use this page

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

See [../configuration/multi-tenancy.md](../configuration/multi-tenancy.md).

## Validation checklist

- App starts without configuration exceptions.
- `/___setup` is reachable when `CosmosAllowSetup=true`.
- Storage connection test succeeds in Step 1.
- Admin creation succeeds in Step 2.
- First publish succeeds after setup.

## Related guides

- [overview.md](overview.md)
- [setup-wizard.md](setup-wizard.md)
- [post-installation.md](post-installation.md)
- [../configuration/storage/overview.md](../configuration/storage/overview.md)
