<!-- Audience: Developers -->
<!-- Type: How-to -->
<!-- Status: Draft -->
<!-- Source: SkyCMS/Docs/Installation/README.md -->

# Local Development Installation

## When to use this page

Use this guide when you want to run SkyCMS locally for feature development or debugging.

## Prerequisites

- .NET SDK compatible with the solution.
- A local or remote database connection string.
- A storage connection string (or test storage account/bucket).

## Configure environment variables

Set at least the required values:

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

Then open `http://localhost:5000/___setup` (or your configured local URL).

## Verify setup

- Setup wizard completes.
- Admin login works.
- File upload succeeds.
- A test page publishes and renders.

## Related guides

- [minimum-required-settings.md](minimum-required-settings.md)
- [setup-wizard.md](setup-wizard.md)
- [post-installation.md](post-installation.md)
