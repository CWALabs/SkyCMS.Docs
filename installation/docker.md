---
canonical_title: Install with Docker
description: Run SkyCMS in containers for local development, testing, or self-hosted deployments.
doc_type: How-to
product_area: installation
user_intent: install-skycms-with-docker
audience:
	- Developers
	- DevOps
difficulty: intermediate
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# Install with Docker

## Summary

Use this guide when running SkyCMS in containers for local testing, development, or self-hosted deployments.

## Prerequisites

- Docker and Docker Compose.
- Environment variables or mounted configuration for required SkyCMS settings.
- Persistent volume strategy for database/content where applicable.

## Outcome

After completing this guide, your containers should be running, setup should be complete, and the environment should be ready for post-install validation.

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

## Verification

This installation is complete when the containers remain healthy after setup, administrator sign-in works, and publish and upload flows succeed.

## Common Docker issues

- App restarts repeatedly: verify required environment variables and connection strings.
- Cannot persist data: validate mounted volume paths and write permissions.
- Setup not available: ensure `CosmosAllowSetup=true` for first run.

## Related guides

- [Minimum Required Settings](minimum-required-settings.md)
- [Setup Wizard](setup-wizard.md)
- [Post-Installation Configuration](post-installation.md)
- [Docker Deployment](../deployment/docker.md)
