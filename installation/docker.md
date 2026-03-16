<!-- Audience: Developers and DevOps -->
<!-- Type: How-to -->
<!-- Status: Draft -->
<!-- Source: SkyCMS/docker-compose.yml -->

# Install with Docker

## When to use this page

Use this guide when running SkyCMS in containers for local testing, development, or self-hosted deployments.

## Prerequisites

- Docker and Docker Compose.
- Environment variables or mounted configuration for required SkyCMS settings.
- Persistent volume strategy for database/content where applicable.

## Compose configuration

Configure required settings through environment variables in your compose file:

- `ConnectionStrings__ApplicationDbContextConnection`
- `ConnectionStrings__StorageConnectionString`
- `AzureBlobStorageEndPoint`
- `CosmosPublisherUrl`
- `CosmosAllowSetup=true` (initial setup only)

Use `CosmosAllowSetup=false` after setup completes.

## Start containers

```bash
docker compose up -d
```

Open the application URL and navigate to `/___setup` to complete configuration.

## Initialize SkyCMS

1. Complete setup wizard steps.
2. Finalize and allow the container to restart.
3. Sign in with the admin account created during setup.

## Common Docker issues

- App restarts repeatedly: verify required environment variables and connection strings.
- Cannot persist data: validate mounted volume paths and write permissions.
- Setup not available: ensure `CosmosAllowSetup=true` for first run.

## Related guides

- [minimum-required-settings.md](minimum-required-settings.md)
- [setup-wizard.md](setup-wizard.md)
- [post-installation.md](post-installation.md)
- [../deployment/docker.md](../deployment/docker.md)
