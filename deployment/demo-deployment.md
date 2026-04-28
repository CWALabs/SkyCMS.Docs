---
canonical_title: Demo Deployment
description: Deploy a pre-seeded SkyCMS demo on Azure for evaluation, onboarding, and workflow walkthroughs.
doc_type: How-to
product_area: deployment
user_intent: deploy-and-destroy-skycms-demo-environment
audience:
  - Evaluators
  - Administrators
  - Developers
difficulty: beginner
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# Demo Deployment

## Summary

The SkyCMS demo deployment creates a ready-to-use Azure environment with sample content and pre-seeded data.

Use it for evaluation, training, and product walkthroughs. Do not treat this path as a production baseline.

## What gets deployed

The demo Bicep stack provisions:

| Resource | Purpose |
| --- | --- |
| Azure Storage Account | Stores blob content and file share data |
| Blob container demo-content | Holds sample media and site assets |
| Azure Files share demo-sqlite | Holds the seeded SQLite database |
| App Service Plan | Hosts the containerized editor runtime |
| Web App | Runs Sky.Editor container image |

## Seed content

The deployment seeds data from a release package:

- demo.db containing sample pages, templates, users, and settings,
- demo-blobs.zip containing sample images and static assets.

## Prerequisites

1. Azure CLI installed and authenticated.
2. PowerShell available.
3. Active Azure subscription with permission to create resource groups and app resources.

## Deploy the demo

From the demo repository root:

```powershell
.\deploy-demo.ps1
```

The script prompts for:

| Prompt | Description |
| --- | --- |
| Resource group name | Required target resource group |
| Azure region | Resource location (for example eastus) |
| Name prefix | Optional naming prefix for resources |

After deployment, open the returned editor URL and verify the sample site is accessible.

## Destroy the demo

```powershell
.\destroy-demo.ps1
```

This removes the full resource group and all demo resources.

## Deployment architecture

```text
deploy-demo.ps1
  -> main.bicep
      -> storage.bicep
      -> webapp.bicep
      -> seed-sqlite.bicep
      -> seed-blobs.bicep
```

## Customization options

- Change planSkuName to use a different App Service tier.
- Replace demoDbUrl and demoBlobsUrl with your own seed artifacts.
- Override editorImage to validate a specific editor image tag.

## Safety notes

- avoid using demo credentials or data patterns in production,
- avoid long-lived demo environments without cost monitoring,
- destroy stale demo resource groups after validation activities.

## Related links

- [Installation Guide](../installation/overview.md)
- [Deploy with Docker](docker.md)
- [CI/CD Pipelines](cicd-pipelines.md)
- [Deployment Overview](overview.md)
