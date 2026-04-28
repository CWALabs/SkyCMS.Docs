---
canonical_title: Setup Wizard Step 1 Storage
description: Configure and validate the storage provider used for uploaded files and media during initial SkyCMS setup.
doc_type: How-to
product_area: installation
user_intent: configure-storage-during-initial-setup
audience:
	- Developers
	- Administrators
difficulty: beginner
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# Setup Wizard: Step 1 Storage

## Summary

Configure the object storage provider for uploaded files and media.

## Outcome

After completing this step, SkyCMS will have a validated object storage configuration ready for media uploads and published artifacts.

## Supported providers

- Azure Blob
- Amazon S3
- Cloudflare R2
- Google Cloud Storage

## Required fields

- `StorageConnectionString`
- `BlobPublicUrl` (often `/`)

## What to decide here

Choose the same storage provider and bucket or container strategy you expect to use after setup. Changing providers later is possible, but it adds migration work and retesting.

## Test before continuing

Use the built-in connection test to confirm credentials and bucket/container accessibility.

## Environment variable pre-configuration

- `ConnectionStrings__StorageConnectionString`
- `AzureBlobStorageEndPoint`

When preconfigured, wizard fields appear masked or read-only.

## Verification

This step is complete when the storage test succeeds and the wizard lets you continue without a provider or credential error.

## Next step

Proceed to [Setup Wizard: Step 2 Admin Account](setup-wizard-step2-admin.md).

## Related guides

- [Storage Overview](../configuration/storage/overview.md)
- [Minimum Required Settings](minimum-required-settings.md)
