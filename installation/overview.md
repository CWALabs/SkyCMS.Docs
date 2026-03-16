<!-- Audience: Developers and DevOps -->
<!-- Type: How-to -->
<!-- Status: Draft -->
<!-- Source: SkyCMS/Docs/Installation/README.md -->

# Installation Overview

## When to use this page

Use this page when you need to choose a SkyCMS installation path and gather prerequisites before running setup.

## Choose an installation path

- Setup Wizard (recommended): interactive first-time configuration at `/___setup` for single-tenant deployments.
- Environment-variable-first setup: preconfigure required settings for containerized and automated deployments.
- Local development: run SkyCMS locally for development and testing.
- Cloud deployment: deploy to Azure, AWS, or Cloudflare-backed hosting patterns.

## Core prerequisites

- .NET SDK (for local development).
- A supported database connection string for `ApplicationDbContextConnection`.
- A storage provider connection string for media and assets.
- Access to your target platform (Azure, AWS, Docker host, or Cloudflare services).

## Minimum required settings

At minimum, configure:

- `ConnectionStrings__ApplicationDbContextConnection`
- `ConnectionStrings__StorageConnectionString`
- `AzureBlobStorageEndPoint` (often `/` for root-relative hosting)
- `CosmosPublisherUrl`
- `CosmosAllowSetup` (set to `true` only while completing setup)

See [minimum-required-settings.md](minimum-required-settings.md) for full examples.

## Recommended installation flow

1. Choose a deployment model and configure database/storage credentials.
2. Start SkyCMS with `CosmosAllowSetup=true`.
3. Complete setup at `/___setup` (storage, admin, publisher, optional email/CDN).
4. Restart the application and sign in with the admin account.
5. Run post-installation verification before opening access.

## Post-install checklist

- Admin login works.
- File upload succeeds in File Manager.
- Publisher URL is reachable.
- First test page publishes correctly.
- Email test passes (if configured).
- CDN purge/invalidation works (if configured).

See [post-installation.md](post-installation.md).

## Related guides

- [minimum-required-settings.md](minimum-required-settings.md)
- [setup-wizard.md](setup-wizard.md)
- [local-development.md](local-development.md)
- [docker.md](docker.md)
- [azure.md](azure.md)
- [aws.md](aws.md)
- [cloudflare-edge-hosting.md](cloudflare-edge-hosting.md)
- [cloudflare-cloud-connector.md](cloudflare-cloud-connector.md)
- [docs-publisher.md](docs-publisher.md)
