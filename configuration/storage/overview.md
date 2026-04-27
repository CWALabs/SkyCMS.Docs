<!-- Audience: Developers and DevOps -->
<!-- Type: Explanation -->
<!-- Status: Draft -->
<!-- Source: SkyCMS/Docs/Configuration/Storage-Overview.md -->

# Storage Overview

## When to use this page

Use this guide when choosing and configuring object storage for SkyCMS assets and published artifacts.

## Configuration key

Use `ConnectionStrings:StorageConnectionString` for the active storage provider.

SkyCMS also supports `ConnectionStrings:AzureBlobStorageConnectionString` as a legacy fallback when the primary storage key is not present.

## Supported providers

- Azure Blob Storage,
- S3-compatible storage,
- Cloudflare R2,
- Google Cloud Storage.

## Automatic provider detection

SkyCMS selects the blob storage driver by inspecting the configured storage connection string. A separate `StorageProvider` flag is not required for the current blob storage path.

- Azure Blob Storage is detected from Azure-style connection strings that begin with `DefaultEndpointsProtocol=`.
- Cloudflare R2 is detected from S3-compatible strings that include `AccountId` and `Bucket`.
- Amazon S3-compatible storage is detected from strings that include `Bucket` and `Region`.
- Google Cloud Storage typically follows the S3-compatible path when configured with interoperable S3-style settings.

This behavior is implemented in the `Cosmos.BlobService` runtime used by SkyCMS storage abstractions.

For the exact connection-string shapes, see [Storage Configuration Reference](./configuration-reference.md).

For the developer-focused code walkthrough, see [Storage Provider Auto-Detection](../../for-developers/storage-provider-auto-detection.md).

## Selection guidance

- choose provider aligned with your cloud platform and operations,
- verify lifecycle, retention, and access policy requirements,
- test upload/read/delete flows before production rollout.

## Related guides

- [Storage Configuration Reference](./configuration-reference.md)
- [Azure Blob](./azure-blob.md)
- [S3-Compatible](./s3.md)
- [Cloudflare R2](./cloudflare-r2.md)
- [Create Cloudflare R2 API Credentials](./cloudflare-r2-api-credentials.md)
- [Google Cloud Storage](./google-cloud.md)
- [Storage Provider Auto-Detection](../../for-developers/storage-provider-auto-detection.md)
