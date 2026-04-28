---
canonical_title: SkyCMS Quick Start
description: Get SkyCMS running locally, complete setup, publish your first page, and verify output.
doc_type: Tutorial
product_area: getting-started
user_intent: run-skycms-locally-and-publish-first-page
audience:
	- Developers
	- Administrators
difficulty: beginner
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# Quick Start

## Summary

Use this tutorial to get SkyCMS running locally and complete one full publish cycle.

## Outcome

After completing this tutorial, you will be able to:

- run SkyCMS locally,
- complete first-time setup,
- create and publish a page,
- verify live output and core dependencies.

## Prerequisites

- .NET SDK compatible with the SkyCMS solution.
- A database connection string.
- A storage connection string.
- Local clone of the SkyCMS solution.

If you need detailed setup values first, use:

- [Minimum Required Settings](../installation/minimum-required-settings.md)
- [Local Development Installation](../installation/local-development.md)

## Steps

1. Configure required environment variables.

Replace the example values below with your own database and storage values:

```powershell
$env:CosmosAllowSetup = "true"
$env:ConnectionStrings__ApplicationDbContextConnection = "Data Source=D:\\data\\cosmoscms.db"
$env:ConnectionStrings__StorageConnectionString = "Bucket=my-bucket;Region=us-east-1;KeyId=...;Key=...;"
$env:AzureBlobStorageEndPoint = "/"
$env:CosmosPublisherUrl = "http://localhost:5000"
```

1. Start the editor application.

From the SkyCMS source root:

```powershell
dotnet run --project Sky.Editor.csproj
```

1. Complete first-time setup.

- Open `http://localhost:5000/___setup`.
- Follow setup wizard steps.
- Create your initial admin account.

1. Create and publish a test page.

- Sign in to the editor.
- Create a simple page with clear text, such as "Quick Start Test".
- Publish the page.

1. Verify end-to-end behavior.

- Confirm the page renders at the expected URL.
- Confirm linked assets load successfully.
- Confirm file upload works from the editor.

## Checkpoints

- Setup wizard completes without errors.
- Admin login succeeds.
- First page is visible after publish.
- No blocking errors in local logs during publish.

## For AI consumers

If you are grounding an AI assistant or retrieval workflow on SkyCMS documentation, start with:

- [Key Concepts](key-concepts.md)
- [AI Context Pack](../reference/ai-context-pack.md)

## Next steps

- [Post-Installation Configuration](../installation/post-installation.md)
- [Configuration Overview](../configuration/overview.md)
- [Deployment Overview](../deployment/overview.md)
- [For Editors](../for-editors/index.md)
