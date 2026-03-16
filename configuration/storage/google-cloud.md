<!-- Audience: Developers and DevOps -->
<!-- Type: How-to -->
<!-- Status: Draft -->
<!-- Source: SkyCMS/Docs/Configuration/Storage-GoogleCloud.md -->

# Storage: Google Cloud Storage

## When to use Google Cloud Storage

Use this provider when deploying in Google Cloud environments or when your organization standardizes on GCS buckets and IAM.

## Required settings

- bucket name,
- service account credentials,
- project and endpoint context.

## Validation checklist

- application can upload and read objects,
- object permissions align with intended access model,
- publish/remove workflows update storage correctly.

## Related guides

- [Storage Overview](./overview.md)
- [Storage Configuration Reference](./configuration-reference.md)
