<!-- Audience: Developers and DevOps -->
<!-- Type: How-to -->
<!-- Status: Draft -->
<!-- Source: SkyCMS/Docs/Configuration/Storage-AzureBlob.md -->

# Storage: Azure Blob

## When to use Azure Blob

Use Azure Blob Storage when deploying in Azure and you want managed object storage with robust access control and lifecycle options.

## Required settings

- blob connection string,
- container name,
- optional prefix/folder conventions.

## Example configuration

Keep connection strings in secret stores. Prefer managed identity patterns where available.

## Validation checklist

- upload test succeeds,
- generated asset URLs resolve,
- publish/remove flows update blobs as expected.

## Related guides

- [Storage Overview](./overview.md)
- [Azure Blob Credentials](./azure-blob-credentials.md)
- [Storage Configuration Reference](./configuration-reference.md)
