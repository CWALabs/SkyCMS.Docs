---
canonical_title: Install on Azure
description: Deploy SkyCMS on Azure App Service or a comparable Azure-hosted runtime and complete first-time setup.
doc_type: How-to
product_area: installation
user_intent: install-skycms-on-azure
audience:
	- DevOps
difficulty: intermediate
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# Install on Azure

## Summary

Use this guide when deploying SkyCMS to Azure App Service or an equivalent Azure-hosted runtime.

## Prerequisites

- Azure subscription with permission to create app/service resources.
- App hosting target (for example, App Service) and optional storage/CDN resources.
- Connection strings and settings for database and blob storage.

## Outcome

After completing this guide, SkyCMS should be running on Azure, the setup wizard should be complete, and the site should be ready for post-installation validation.

## Deploy resources

1. Provision your application host.
2. Provision database and storage resources.
3. Configure DNS/TLS for the intended publisher URL.

Reference deployment guidance in:

- [Azure Deployment](../deployment/azure.md)
- [Deployment Overview](../deployment/overview.md)

## Configure application settings

Set required app settings (App Service Configuration or equivalent):

- `ConnectionStrings__ApplicationDbContextConnection`
- `ConnectionStrings__StorageConnectionString`
- `AzureBlobStorageEndPoint`
- `CosmosPublisherUrl`
- `CosmosAllowSetup=true` (temporary)

See [Minimum Required Settings](minimum-required-settings.md).

## Run setup flow

1. Open `https://<your-site>/___setup`.
2. Complete storage, admin, and publisher steps.
3. Configure optional email and CDN settings.
4. Finalize setup.

See [Setup Wizard](setup-wizard.md).

## Validate deployment

- Restart the app after setup completion.
- Confirm admin login and editor access.
- Upload a test asset.
- Publish a test page and verify the public URL.
- Send a test email if email provider is configured.

See [Post-Installation Configuration](post-installation.md).

## Troubleshooting

- Setup route unavailable: verify `CosmosAllowSetup=true` and restart.
- Connection failures: validate connection strings and identity/secret values.
- Publisher not reachable: verify URL, DNS, TLS, and platform ingress settings.
- Upload failures: verify storage connection string and endpoint.

## Related guides

- [Minimum Required Settings](minimum-required-settings.md)
- [Setup Wizard](setup-wizard.md)
- [Post-Installation Configuration](post-installation.md)
- [Azure Deployment](../deployment/azure.md)
