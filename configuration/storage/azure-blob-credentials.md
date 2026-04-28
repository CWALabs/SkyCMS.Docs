---
canonical_title: Get Azure Blob Storage Credentials
description: Retrieve Azure Blob Storage connection details for SkyCMS media and asset storage.
doc_type: How-to
product_area: configuration
user_intent: get-azure-blob-credentials-for-skycms
audience:
	- DevOps
difficulty: intermediate
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# Get Azure Blob Storage Credentials

## Summary

Use this guide when SkyCMS needs credentials to connect to Azure Blob Storage for media or asset storage.

## What SkyCMS needs

SkyCMS uses a connection string for Azure Blob Storage. The connection string bundles the account name, key, and endpoint into a single value.

Required values:

- `Connection string` (contains account name, key, and endpoint)
- `Container name`

Microsoft recommends managed identities over connection strings when SkyCMS is hosted in Azure. See [Before you start](#before-you-start) to choose the right approach.

## Before you start

- Confirm the storage account already exists in the Azure portal.
- Confirm the target container exists, or know the name you will create.
- Decide whether to use a connection string (simpler, works anywhere) or a managed identity (more secure, Azure-hosted only).

This guide covers connection strings. If SkyCMS is hosted in Azure App Service or Azure Container Apps and you want to avoid long-lived credentials, use a managed identity and see the [Azure Blob Storage documentation](https://learn.microsoft.com/en-us/azure/storage/common/authorize-data-access) instead.

## Step 1: Open the storage account in the Azure portal

1. Sign in to the [Azure portal](https://portal.azure.com/).
2. Open **Storage accounts** (search for it in the top search bar if needed).
3. Select the storage account that SkyCMS will use.

## Step 2: Copy the connection string

1. In the left menu of the storage account, under **Security + networking**, select **Access keys**.
2. Select **Show keys** to reveal the key values.
3. Under **key1**, find the **Connection string** field.
4. Select the **Copy** button next to the connection string value.

The connection string looks like:

```text
DefaultEndpointsProtocol=https;AccountName=mystorageaccount;AccountKey=XXXX==;EndpointSuffix=core.windows.net
```

Store this value immediately in your secret manager. Do not paste it into source-controlled files.

Both `key1` and `key2` connection strings work. Using `key1` is conventional; reserve `key2` for rotation.

## Step 3: Find or create the container

1. In the left menu of the storage account, under **Data storage**, select **Containers**.
2. If the container already exists, copy its exact name.
3. To create a new container, select **+ Container**, enter a name, set the public access level to **Private (no anonymous access)**, and select **Create**.

The container name is the short identifier (for example, `skycms-assets`), not the full URL.

## Step 4: Map values into SkyCMS

Enter the following values in the SkyCMS storage settings or set them as environment variables:

| SkyCMS setting | Value |
| --- | --- |
| `BlobConnectionString` | Connection string from Step 2 |
| `BlobContainerName` | Container name from Step 3 |

See [Storage: Azure Blob](./azure-blob.md) for the full configuration reference.

## Key rotation

Azure Blob Storage provides two access keys so you can rotate without downtime:

1. Update SkyCMS to use the `key2` connection string (under **Security + networking** → **Access keys** → **key2**).
2. Verify SkyCMS operates normally with the key2 connection string.
3. Return to **Access keys** and select **Rotate key** next to `key1`.
4. Update SkyCMS back to the `key1` connection string if desired.

## Common mistakes

- Copying the account key (raw base64 string) instead of the full connection string. SkyCMS expects the full connection string format.
- Setting the container public access level to **Blob** or **Container** — this exposes all blobs publicly. Use **Private** and let SkyCMS generate SAS URLs or serve through its publisher.
- Using the blob service endpoint URL instead of the connection string. These are different values on the **Endpoints** page.

## Related guides

- [Storage: Azure Blob](./azure-blob.md)
- [Storage Overview](./overview.md)
- [Storage Configuration Reference](./configuration-reference.md)
