<!-- Audience: DevOps -->
<!-- Type: How-to -->

# Create Cloudflare R2 API Credentials

Use this guide when SkyCMS needs Cloudflare R2 credentials for documentation assets, media storage, or other S3-compatible object storage flows.

## What SkyCMS needs

SkyCMS needs these R2 values:

- `Account ID`
- `Bucket name`
- `Access Key ID`
- `Secret Access Key`
- `R2 endpoint`

For SkyCMS upload and maintenance flows, start with an R2 token that uses Cloudflare's writable object permission and scope it to the specific bucket whenever possible.

## Before you start

- Confirm R2 is enabled on the target Cloudflare account.
- Create the target bucket first, or know exactly which existing bucket SkyCMS will use.
- Decide whether this credential should be user-owned or account-owned.

## Step 1: Find the Account ID

Use one of these Cloudflare dashboard locations:

1. `Account home` -> locate the account -> copy `Account ID`
2. `Workers & Pages` -> `Account details` -> copy `Account ID`

Save the value because you will need it for both the endpoint and the SkyCMS connection string.

## Step 2: Create or confirm the R2 bucket

1. Open `R2 Object Storage`.
2. Create the bucket if it does not already exist.
3. Record the exact bucket name.
4. If your organization uses jurisdictional buckets, note that you must use the matching jurisdictional endpoint later.

## Step 3: Open the R2 token manager

1. In the Cloudflare dashboard, open `R2 Object Storage`.
2. Under `Account Details`, select `Manage` next to `API Tokens`.

This R2 flow is separate from the general Cloudflare API token UI used for CDN purge tokens.

## Step 4: Choose the token type

Choose one of these options:

- `Create Account API token`: recommended for durable automation and shared environments
- `Create User API token`: acceptable for personal setup and short-lived admin tasks

## Step 5: Choose the permission level

For SkyCMS, start with one of these permission choices:

- `Object Read & Write`: recommended default for a specific bucket used by SkyCMS
- `Admin Read & Write`: broader than most SkyCMS setups need; use only when you intentionally need bucket administration

Avoid `Admin Read & Write` unless your deployment truly needs to create, delete, or reconfigure buckets.

## Step 6: Scope the token

If you chose `Object Read & Write`, scope the token to the specific bucket used by SkyCMS.

Recommended default:

- one token per environment
- one bucket per token when practical
- avoid account-wide scope unless required by your deployment model

## Step 7: Create and copy the credentials

1. Select `Create Account API token` or `Create User API token`.
2. Copy the generated `Access Key ID`.
3. Copy the generated `Secret Access Key`.

Cloudflare only shows the secret access key once. Store it immediately in your secret manager.

## Step 8: Build the R2 endpoint

Use this endpoint format for standard buckets:

```text
https://<ACCOUNT_ID>.r2.cloudflarestorage.com
```

For jurisdictional buckets, Cloudflare requires the matching endpoint:

- EU: `https://<ACCOUNT_ID>.eu.r2.cloudflarestorage.com`
- FedRAMP: `https://<ACCOUNT_ID>.fedramp.r2.cloudflarestorage.com`

## Step 9: Map the values into SkyCMS

SkyCMS documents the Cloudflare R2 connection string pattern as:

```text
AccountId=...;Bucket=...;KeyId=...;Key=...
```

Map the Cloudflare values like this:

- `AccountId` -> Cloudflare `Account ID`
- `Bucket` -> R2 bucket name
- `KeyId` -> `Access Key ID`
- `Key` -> `Secret Access Key`

## Step 10: Validate the configuration

After storing the connection string in SkyCMS or your deployment secrets:

1. Test storage connectivity.
2. Upload a file.
3. Read the file back.
4. Delete a test file.
5. Confirm the bucket contains only the expected objects after cleanup.

## Common mistakes and tips

- Do not create the R2 credential from the generic Cloudflare API token page when you really need S3-style R2 access keys.
- Copy the secret access key immediately. It is shown once.
- If a bucket uses a jurisdiction, the default R2 endpoint will not work.
- Prefer bucket-scoped writable credentials over account-wide admin credentials.
- Use a separate token for production and non-production buckets.
- For CI/CD and team-owned infrastructure, prefer account-owned tokens over user-owned tokens.

## Related guides

- [Cloudflare R2](./cloudflare-r2.md)
- [Storage Overview](./overview.md)
- [Storage Configuration Reference](./configuration-reference.md)
- [Deploy with Cloudflare](../../deployment/cloudflare.md)