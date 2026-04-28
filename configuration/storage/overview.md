---
canonical_title: Storage Overview
description: Choose and configure object storage for SkyCMS assets and published artifacts.
doc_type: Explanation
product_area: configuration
user_intent: choose-and-configure-skycms-storage
audience:
  - Developers
  - Administrators
  - DevOps
difficulty: beginner
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# Storage Overview

## Summary

SkyCMS uses object storage for media and published artifacts.

Use this page to choose a storage provider and apply the correct configuration path.

## Supported providers

- Azure Blob Storage
- S3-compatible storage
- Cloudflare R2
- Google Cloud Storage

## Configuration model

Primary key:

- `ConnectionStrings:StorageConnectionString`

Legacy fallback:

- `ConnectionStrings:AzureBlobStorageConnectionString`

SkyCMS detects storage behavior from configured connection-string patterns for the active storage path.

## Provider selection guidance

| Scenario | Recommended provider |
| --- | --- |
| Azure-first environments | Azure Blob Storage |
| AWS-first environments | S3-compatible storage |
| Cloudflare edge-heavy delivery | Cloudflare R2 |
| GCP ecosystem alignment | Google Cloud Storage |

## Setup sequence

1. Select provider based on hosting and operations preferences.
2. Configure storage connection settings.
3. Validate upload, read, and delete behavior.
4. Validate publish output writes to expected storage targets.

## Validation checklist

- editor file upload succeeds,
- uploaded assets are retrievable,
- the publish operation writes expected artifacts,
- no persistent storage-auth or endpoint errors appear in logs.

## Related guides

- [Storage Configuration Reference](./configuration-reference.md)
- [Azure Blob](./azure-blob.md)
- [S3-Compatible](./s3.md)
- [Cloudflare R2](./cloudflare-r2.md)
- [Create Cloudflare R2 API Credentials](./cloudflare-r2-api-credentials.md)
- [Google Cloud Storage](./google-cloud.md)
- [Storage Provider Auto-Detection](../../for-developers/storage-provider-auto-detection.md)
