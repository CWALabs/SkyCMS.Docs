---
canonical_title: Cloudflare Edge Hosting
description: Host SkyCMS static output with Cloudflare R2 and edge rules in an origin-less delivery pattern.
doc_type: How-to
product_area: installation
user_intent: host-skycms-output-with-cloudflare-edge-rules-and-r2
audience:
	- Developers
	- DevOps
difficulty: intermediate
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# Cloudflare Edge Hosting

## Summary

Use this guide when hosting a static SkyCMS output with Cloudflare R2 and Cloudflare edge rules in an origin-less pattern.

## Prerequisites

- Cloudflare account with R2.
- Bucket, API credentials, and custom domain capability.
- SkyCMS publishing configured to target R2.

### Values to collect before you start

Keep these values in a scratch file so you can copy and paste during setup.

- Cloudflare account ID
- R2 bucket name
- R2 S3 access key ID
- R2 S3 secret access key
- Site hostname (example: `www.example.com`)
- Cloudflare zone name (example: `example.com`)

## Outcome

After completing this guide, published SkyCMS content should resolve through Cloudflare using the intended rewrite and redirect rules.

## Core setup flow

1. Create an R2 bucket.
2. Configure `ConnectionStrings__StorageConnectionString` for R2.
3. Bind a custom domain to the bucket.
4. Add rule for root path rewrite to `/index.html`.
5. Add HTTP to HTTPS redirect rule.

For mixed content scenarios (for example MkDocs content plus SkyCMS pages), add an additional targeted rewrite rule for directory index paths before the root rewrite rule.

---

## Step 1: Create an R2 bucket

1. Open Cloudflare dashboard.
2. Select your account.
3. Go to **R2 Object Storage**.
4. Click **Create bucket**.
5. Enter values:
	- **Bucket name**: use a DNS-safe name (example: `site-prod-content`)
	- **Location hint/region**: choose the region closest to your primary authoring pipeline (or keep default)
6. Click **Create bucket**.
7. Open the new bucket and confirm it appears under **R2 Object Storage**.

Expected result:
- The bucket exists and is selectable from the R2 bucket list.

---

## Step 2: Configure SkyCMS storage to use R2

Choose one of the two methods below.

### Option A: Setup wizard (recommended)

1. Start SkyCMS with setup enabled.
2. Open the setup wizard.
3. In **Step 1: Storage**, enter the storage connection string:

```text
AccountId=<account-id>;Bucket=<bucket-name>;AccessKeyId=<access-key-id>;SecretAccessKey=<secret-access-key>;
```

4. Set public URL to one of:
	- Root-hosted pattern: `/`
	- Direct R2 custom domain pattern: `https://www.example.com/`
	- Direct bucket URL pattern: `https://<bucket>.<account-id>.r2.cloudflarestorage.com/`
5. Save and continue.

### Option B: Environment variables

Set values before app startup:

```powershell
$env:ConnectionStrings__StorageConnectionString = "AccountId=<account-id>;Bucket=<bucket-name>;AccessKeyId=<access-key-id>;SecretAccessKey=<secret-access-key>;"
$env:AzureBlobStorageEndPoint = "https://www.example.com/"
```

Expected result:
- SkyCMS can upload and read assets from R2.

Quick validation:
1. Upload a test image from the editor.
2. Verify the object appears in your R2 bucket.
3. Open the object URL and confirm a 200 response.

---

## Step 3: Bind custom domain to the R2 bucket

1. In Cloudflare dashboard, go to **R2 Object Storage**.
2. Open your bucket.
3. Go to **Settings**.
4. In **Custom domains**, click **Connect domain** (or **Add custom domain**).
5. Enter your hostname (example: `www.example.com`).
6. Save.
7. If prompted, allow Cloudflare to create or update DNS records.
8. Wait for certificate and domain status to become active.

Expected result:
- Requests to `https://www.example.com` reach the bucket through Cloudflare.

Quick validation:
1. Place `index.html` in the bucket root.
2. Open `https://www.example.com/index.html`.
3. Confirm a 200 response and expected page content.

---

## Step 4: Add rewrite rule for root path to /index.html

This rule makes the site root (`/`) resolve to `index.html`.

1. Open Cloudflare dashboard for the site zone.
2. Go to **Rules**.
3. Open **URL Rewrite Rules** (or **Transform Rules -> URL Rewrite** depending on plan UI).
4. Click **Create rule**.
5. Rule name: `rewrite-root-to-index`.
6. Match condition:
	- Use **Custom filter expression**.
	- Expression:

```text
(http.request.uri.path eq "") or (http.request.uri.path eq "/")
```

7. Rewrite action:
	- Target path: static path
	- Value: `/index.html`
8. Save and deploy.

Expected result:
- `https://www.example.com/` serves `index.html` from the bucket.

Quick validation:
1. Request `https://www.example.com/`.
2. Confirm content is same as `https://www.example.com/index.html`.

---

## Step 5: Add HTTP to HTTPS redirect rule

1. Open Cloudflare dashboard for the site zone.
2. Go to **Rules -> Redirect Rules**.
3. Click **Create rule**.
4. Rule name: `redirect-http-to-https`.
5. Match condition:

```text
http.request.scheme eq "http"
```

6. Action:
	- Redirect type: **Dynamic**
	- URL expression:

```text
concat("https://", http.request.host, http.request.uri.path)
```

	- Preserve query string: enabled
	- Status code: **301**
7. Save and deploy.

Expected result:
- `http://www.example.com/...` redirects to `https://www.example.com/...`.

Quick validation:
1. Open an HTTP URL for your site.
2. Confirm a single 301 redirect to the HTTPS equivalent.

---

## Mixed content scenario: add directory rewrite before root rewrite

Use this when directory-style URLs must map to `index.html` under that directory, such as:

- `/getting-started/quick-start/` -> `/getting-started/quick-start/index.html`
- `/for-editors/overview/` -> `/for-editors/overview/index.html`

Rule order is required:

1. Directory index rewrite (more specific)
2. Root rewrite to `/index.html` (less specific)

Example directory rule expression:

```text
http.request.uri.path ne "/" and ends_with(http.request.uri.path, "/")
```

Example dynamic target expression:

```text
concat(http.request.uri.path, "index.html")
```

Notes:
- Place this rule above `rewrite-root-to-index`.
- If you serve files with extensions, keep extension-specific routes out of this rule.

---

## End-to-end verification checklist

Run all checks before go-live:

1. R2 bucket is reachable from Cloudflare custom domain.
2. `/index.html` is accessible directly.
3. `/` rewrites to `/index.html`.
4. Directory paths (if used) rewrite to directory `index.html`.
5. HTTP redirects to HTTPS in one hop.
6. No redirect loops.
7. No unexpected 404s for published paths.
8. Cache behavior matches your intended TTL policy.

## SkyCMS storage connection format

```text
AccountId=<account-id>;Bucket=<bucket>;AccessKeyId=<access-key-id>;SecretAccessKey=<secret-access-key>;
```

## Operational notes

- Keep rule order intentional.
- Validate rewrite behavior with trace tools before going live.
- Use cache rules separately for desired TTL behavior.

## Verification

This setup is complete when directory-style URLs resolve to the expected static content, HTTPS redirects work, and edge rules do not create loops or unexpected cache misses.

## Related guides

- [Cloudflare Cloud Connector](cloudflare-cloud-connector.md)
- [Cloudflare R2 Storage](../configuration/storage/cloudflare-r2.md)
- [Cloudflare Deployment](../deployment/cloudflare.md)
