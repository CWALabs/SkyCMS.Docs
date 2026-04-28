---
canonical_title: Storage: Google Cloud Storage
description: Configure Google Cloud Storage for SkyCMS assets and published artifacts in GCP-aligned environments.
doc_type: How-to
product_area: configuration
user_intent: configure-skycms-google-cloud-storage
audience:
	- Developers
	- DevOps
difficulty: intermediate
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# Storage: Google Cloud Storage

## Summary

Use this provider when deploying in Google Cloud environments or when your organization standardizes on GCS buckets and IAM.

## Required settings

- bucket name,
- service account credentials,
- project and endpoint context.

## Validation checklist

- application can upload and read objects,
- object permissions align with intended access model,
- publish and remove workflows update storage correctly.

## Related guides

- [Storage Overview](./overview.md)
- [Storage Configuration Reference](./configuration-reference.md)
