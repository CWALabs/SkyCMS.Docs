---
canonical_title: Storage: Azure Blob
description: Configure Azure Blob Storage for SkyCMS media and published artifact storage.
doc_type: How-to
product_area: configuration
user_intent: configure-skycms-azure-blob-storage
audience:
	- Developers
	- DevOps
difficulty: intermediate
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# Storage: Azure Blob

## Summary

Use Azure Blob Storage when deploying in Azure and you want managed object storage with robust access control and lifecycle options.

## Required settings

- blob connection string,
- container name,
- optional prefix or folder conventions.

## Example configuration

Keep connection strings in secret stores. Prefer managed identity patterns where available.

## Validation checklist

- upload test succeeds,
- generated asset URLs resolve,
- publish and remove flows update blobs as expected.

## Related guides

- [Storage Overview](./overview.md)
- [Azure Blob Credentials](./azure-blob-credentials.md)
- [Storage Configuration Reference](./configuration-reference.md)
