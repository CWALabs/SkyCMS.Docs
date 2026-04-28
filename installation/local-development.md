---
canonical_title: Local Development Installation
description: Run SkyCMS locally for feature development, debugging, and first-pass workflow validation.
doc_type: How-to
product_area: installation
user_intent: run-skycms-locally-for-development
audience:
	- Developers
difficulty: beginner
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# Local Development Installation

## Summary

Use this guide when you want to run SkyCMS locally for feature development or debugging.

## Prerequisites

- .NET SDK compatible with the solution.
- A local or remote database connection string.
- A storage connection string (or test storage account/bucket).

## Outcome

After completing this guide, you should be able to run SkyCMS locally, complete setup, and verify a first publish flow.

## Configure environment variables

Set at least the required values shown below:

```powershell
$env:CosmosAllowSetup = "true"
$env:ConnectionStrings__ApplicationDbContextConnection = "Data Source=D:\\data\\cosmoscms.db"
$env:ConnectionStrings__StorageConnectionString = "Bucket=my-bucket;Region=us-east-1;KeyId=...;Key=...;"
$env:AzureBlobStorageEndPoint = "/"
$env:CosmosPublisherUrl = "http://localhost:5000"
```

## Run the app

From the repository root:

```powershell
dotnet run --project Sky.Editor.csproj
```

Then open `http://localhost:5000/___setup`, or the local URL you configured.

## Verify setup

- the setup wizard completes,
- admin login works,
- file upload succeeds,
- a test page publishes and renders.

## Related guides

- [Minimum Required Settings](minimum-required-settings.md)
- [Setup Wizard](setup-wizard.md)
- [Post-Installation Configuration](post-installation.md)
