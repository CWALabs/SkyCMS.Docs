# Demo Deployment

The SkyCMS Demo provides a one-command deployment of a fully configured SkyCMS instance on Azure, complete with sample content and a pre-seeded SQLite database. Use it for evaluation, training, or demonstration purposes.

**Audience:** Evaluators, Administrators

---

## What Gets Deployed

The demo provisions the following Azure resources via Bicep:

| Resource | Details |
|----------|---------|
| **Azure Storage Account** | Standard_LRS, TLS 1.2, private blob access |
| **Blob container** | `demo-content` — sample media and site assets |
| **Azure Files share** | `demo-sqlite` — 5 GB, holds the SQLite database |
| **App Service Plan** | Linux, P1v3 SKU (Premium tier) |
| **Web App** | Docker container running Sky.Editor |

### Seed Data

Two deployment scripts download pre-built seed data from a GitHub Release:

- **demo.db** — A pre-configured SQLite database with sample pages, templates, users, and settings. Uploaded to the Azure Files share.
- **demo-blobs.zip** — Sample images, CSS, and media files. Extracted and uploaded to the blob container.

---

## Deploying

### Prerequisites

- Azure CLI installed and authenticated (`az login`)
- PowerShell
- An Azure subscription

### Deploy

```powershell
cd SkyCMS.Demo
.\deploy-demo.ps1
```

The script prompts for:

| Prompt | Default | Description |
|--------|---------|-------------|
| **Resource group name** | — | Required. Creates the group if it doesn't exist. |
| **Azure region** | `eastus` | Where to provision resources. |
| **Name prefix** | Auto-generated | Prefix for resource names. If empty, a unique string is generated. |

After deployment completes, the script outputs the editor URL. Open it in a browser to access the demo site.

### Tear Down

```powershell
.\destroy-demo.ps1
```

Prompts for the resource group name, then deletes the entire resource group (asynchronous — the command returns immediately while Azure processes the deletion).

---

## Architecture

```
deploy-demo.ps1
  └─ main.bicep
       ├─ storage.bicep     → Storage Account (Blob + Files)
       ├─ webapp.bicep       → App Service Plan + Web App (Docker)
       ├─ seed-sqlite.bicep  → Download demo.db → Azure Files
       └─ seed-blobs.bicep   → Download demo-blobs.zip → Blob Container
```

### Bicep Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `location` | string | Resource group location | Azure region |
| `namePrefix` | string | Auto-generated | Resource naming prefix |
| `demoDbUrl` | string | — | GitHub Release URL for demo.db |
| `demoBlobsUrl` | string | — | GitHub Release URL for demo-blobs.zip |
| `editorImage` | string | — | Docker image for Sky.Editor |
| `planSkuName` | string | `P1v3` | App Service Plan SKU |
| `blobContainerName` | string | `demo-content` | Blob container name |
| `filesShareName` | string | `demo-sqlite` | Azure Files share name |

### Seed Scripts

Both seed modules use `Microsoft.Resources/deploymentScripts` (Azure PowerShell v10.0) with a 30-minute timeout. They authenticate via managed identity login mode.

---

## Customization

- **Change the SKU** — Set `planSkuName` to a different App Service Plan tier (e.g., `B1` for Basic).
- **Use your own data** — Replace the `demoDbUrl` and `demoBlobsUrl` parameters with URLs to your own seed files.
- **Change the container image** — Set `editorImage` to a different Docker image tag.

---

## See Also

- [Installation Guide](../installation/overview.md) — Full production installation
- [Docker Deployment](docker.md) — Docker Compose deployment
- [CI/CD Pipelines](cicd-pipelines.md) — Automated build and deployment workflows
