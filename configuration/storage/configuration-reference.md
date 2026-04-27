<!-- Audience: Developers and DevOps -->
<!-- Type: Reference -->
<!-- Status: Draft -->
<!-- Source: SkyCMS/Docs/Configuration/Storage-Configuration-Reference.md -->

# Storage Configuration Reference

## Configuration keys

`ConnectionStrings:StorageConnectionString`

Primary storage connection string used for runtime provider selection.

`ConnectionStrings:AzureBlobStorageConnectionString`

Legacy Azure fallback key used when the primary storage connection string is not present.

SkyCMS uses the resolved connection string to auto-detect the storage backend. You do not set a separate `StorageProvider` flag for this path.

## Core settings

- container/bucket name,
- access credentials,
- endpoint and region settings where applicable.

## Connection string patterns

### Azure Blob pattern

`DefaultEndpointsProtocol=https;AccountName=...;AccountKey=...;EndpointSuffix=core.windows.net`

### Amazon S3-compatible pattern

`Bucket=...;Region=...;KeyId=...;Key=...`

### Cloudflare R2 pattern

`AccountId=...;Bucket=...;KeyId=...;Key=...`

### Google Cloud Storage pattern

SkyCMS currently follows the S3-compatible path when Google Cloud Storage is configured with interoperable S3-style settings.

## Provider auto-detection

Storage provider selection is based on the resolved connection string pattern.

| Provider path | Typical pattern | Driver |
| ------------- | --------------- | ------ |
| Azure Blob Storage | `DefaultEndpointsProtocol=...` | `AzureStorage` |
| Cloudflare R2 | `AccountId=...;Bucket=...;KeyId=...;Key=...` | `AmazonStorage` |
| Amazon S3-compatible | `Bucket=...;Region=...;KeyId=...;Key=...` | `AmazonStorage` |
| Google Cloud Storage | S3-compatible interoperability settings | `AmazonStorage` |

If the connection string does not match a supported pattern, SkyCMS throws a storage configuration error instead of guessing.

## Provider fields

### Azure Blob fields

- connection string,
- container name.

### S3-compatible fields

- key ID,
- key,
- bucket,
- region,
- optional endpoint override.

### Cloudflare R2 fields

- account ID,
- key ID/key,
- bucket name.

See [Create Cloudflare R2 API Credentials](./cloudflare-r2-api-credentials.md) for the exact Cloudflare dashboard steps and endpoint guidance.

### Google Cloud Storage fields

- interoperable S3-style credentials when using the S3-compatible path,
- bucket,
- region or endpoint context as required by the deployment.

For a code-level explanation of where detection happens and how multi-tenant storage resolution works, see [Storage Provider Auto-Detection](../../for-developers/storage-provider-auto-detection.md).

## Related guides

- [Storage Overview](./overview.md)
- [Storage Provider Auto-Detection](../../for-developers/storage-provider-auto-detection.md)
