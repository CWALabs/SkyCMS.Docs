<!-- Audience: DevOps -->
<!-- Type: How-to -->
<!-- Status: Draft -->
<!-- Source: SkyCMS/Docs/Installation/AzureInstall.md -->

# Install on Azure

## When to use this page

Use this guide when deploying SkyCMS to Azure App Service or an equivalent Azure-hosted runtime.

## Prerequisites

- Azure subscription with permission to create app/service resources.
- App hosting target (for example, App Service) and optional storage/CDN resources.
- Connection strings and settings for database and blob storage.

## Deploy resources

1. Provision your application host.
2. Provision database and storage resources.
3. Configure DNS/TLS for the intended publisher URL.

Reference deployment guidance in:

- [../deployment/azure.md](../deployment/azure.md)
- [../deployment/overview.md](../deployment/overview.md)

## Configure application settings

Set required app settings (App Service Configuration or equivalent):

- `ConnectionStrings__ApplicationDbContextConnection`
- `ConnectionStrings__StorageConnectionString`
- `AzureBlobStorageEndPoint`
- `CosmosPublisherUrl`
- `CosmosAllowSetup=true` (temporary)

See [minimum-required-settings.md](minimum-required-settings.md).

## Run setup flow

1. Open `https://<your-site>/___setup`.
2. Complete storage, admin, and publisher steps.
3. Configure optional email and CDN settings.
4. Finalize setup.

See [setup-wizard.md](setup-wizard.md).

## Validate deployment

- Restart the app after setup completion.
- Confirm admin login and editor access.
- Upload a test asset.
- Publish a test page and verify the public URL.
- Send a test email if email provider is configured.

See [post-installation.md](post-installation.md).

## Troubleshooting

- Setup route unavailable: verify `CosmosAllowSetup=true` and restart.
- Connection failures: validate connection strings and identity/secret values.
- Publisher not reachable: verify URL, DNS, TLS, and platform ingress settings.
- Upload failures: verify storage connection string and endpoint.

## Related guides

- [minimum-required-settings.md](minimum-required-settings.md)
- [setup-wizard.md](setup-wizard.md)
- [post-installation.md](post-installation.md)
- [../deployment/azure.md](../deployment/azure.md)
