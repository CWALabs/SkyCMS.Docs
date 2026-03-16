<!-- Audience: Developers and Administrators -->
<!-- Type: How-to -->
<!-- Status: Draft -->
<!-- Source: SkyCMS/Docs/Installation/SetupWizard-Step1-Storage.md -->

# Setup Wizard: Step 1 Storage

## Purpose

Configure the object storage provider for uploaded files and media.

## Supported providers

- Azure Blob
- Amazon S3
- Cloudflare R2
- Google Cloud Storage

## Required fields

- `StorageConnectionString`
- `BlobPublicUrl` (often `/`)

## Test before continuing

Use the built-in connection test to confirm credentials and bucket/container accessibility.

## Environment variable pre-configuration

- `ConnectionStrings__StorageConnectionString`
- `AzureBlobStorageEndPoint`

When preconfigured, wizard fields appear masked or read-only.

## Next step

Proceed to [setup-wizard-step2-admin.md](setup-wizard-step2-admin.md).

## Related guides

- [../configuration/storage/overview.md](../configuration/storage/overview.md)
- [minimum-required-settings.md](minimum-required-settings.md)
