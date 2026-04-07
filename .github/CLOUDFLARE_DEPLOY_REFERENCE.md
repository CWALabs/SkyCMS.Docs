# Deploy Docs to Cloudflare R2 — Workflow Reference

This document describes the GitHub Actions workflow in [`.github/workflows/deploy-docs-cloudflare.yml`](workflows/deploy-docs-cloudflare.yml) that builds and deploys the SkyCMS documentation site to Cloudflare R2.

## Overview

The workflow builds the MkDocs site, runs multiple link and anchor validation checks, syncs the generated HTML to a Cloudflare R2 bucket, and optionally purges the Cloudflare CDN cache.

**Target site:** <https://docs.sky-cms.com>

## Triggers

| Trigger | Condition |
|---|---|
| Push to `main` | Only when matching files change: `**/*.md`, `mkdocs.yml`, `requirements.txt`, `assets/**`, or the workflow file itself |
| Manual | `workflow_dispatch` — run from the GitHub Actions UI at any time |

Concurrent deployments are prevented by the `cloudflare-r2-docs` concurrency group.

## Pipeline Steps

```text
1. Checkout repository
2. Setup Python 3.11
3. Install MkDocs dependencies (from requirements.txt)
4. Pre-build link validation (broken .md links in source)
5. Build MkDocs site (wrapper config pattern)
6. Post-build validation:
   a. Disallow .md hrefs in generated HTML
   b. External link check (advisory, non-blocking)
   c. Broken anchor check
7. Configure AWS CLI for R2
8. Sync site to R2 bucket (authoritative, with --delete)
9. Verify critical pages exist in R2
10. Purge Cloudflare CDN cache (optional)
11. Write deployment summary to GitHub Step Summary
```

## Required Secrets

Configure these in **GitHub → Settings → Secrets and variables → Actions** for the `CWALabs/SkyCMS.Docs` repository.

### R2 Storage (required)

| Secret | Description | Where to Find |
|---|---|---|
| `CLOUD_FLARE_S3_ACCESS_KEY_ID` | R2 API token access key ID | Cloudflare dashboard → R2 → Manage R2 API Tokens → Create API Token |
| `CLOUD_FLARE_S3_SECRET_ACCESS_KEY` | R2 API token secret key | Same as above — shown once at creation |
| `R2_BUCKET_NAME` | Name of the R2 bucket that serves the docs site | Cloudflare dashboard → R2 → Buckets |
| `CLOUD_FLARE_ACCOUNT_ID` | Your Cloudflare account ID (used to construct the R2 endpoint URL) | Cloudflare dashboard → any domain → Overview → right sidebar under "API" |

### CDN Cache Purge (optional)

If these are not configured, the deployment still succeeds — cache purging is skipped gracefully.

| Secret | Description | Where to Find |
|---|---|---|
| `CLOUDFLARE_API_TOKEN` | API token with `Zone.Cache Purge` permission | Cloudflare dashboard → My Profile → API Tokens → Create Token |
| `CLOUDFLARE_ZONE_ID` | Zone ID for the domain hosting `docs.sky-cms.com` | Cloudflare dashboard → domain → Overview → right sidebar under "API" |

### Example Values

```text
CLOUD_FLARE_S3_ACCESS_KEY_ID     = a1b2c3d4e5f6a1b2c3d4e5f6a1b2c3d4
CLOUD_FLARE_S3_SECRET_ACCESS_KEY = abcdef1234567890abcdef1234567890abcdef1234567890abcdef1234567890
R2_BUCKET_NAME                   = skycms-docs
CLOUD_FLARE_ACCOUNT_ID           = 1a2b3c4d5e6f7a8b9c0d1e2f3a4b5c6d
CLOUDFLARE_API_TOKEN             = Sn3kR_abcdefghijklmnop-1234567890
CLOUDFLARE_ZONE_ID               = 9f8e7d6c5b4a3f2e1d0c9b8a7f6e5d4c
```

> **Note:** All values above are placeholders. Never commit real secrets to the repository.

## Build Architecture

The workflow uses a **wrapper config** pattern because MkDocs forbids the config file from living inside `docs_dir`. Since this repo uses `docs_dir: '.'` (the repo root is the documentation source), the build step:

1. Creates a temporary `mkdocs-ci.yml` one directory above the checkout
2. This wrapper inherits the real `mkdocs.yml` via `INHERIT:` and overrides `docs_dir` / `site_dir`
3. Builds into `_ci_site/`, then moves the output back to `./site` for downstream steps
4. Cleans up the temporary config

## Validation Checks

| Check | Blocking? | Description |
|---|---|---|
| Pre-build link validation | Yes | Scans `.md` source files for broken relative links to other `.md` files |
| Disallow markdown hrefs | Yes | Ensures generated HTML doesn't contain `href` attributes pointing to `.md` files (should all be converted to `.html`) |
| External link check | No (advisory) | Uses `linkchecker` to verify external URLs. Failures are logged but don't block deployment |
| Broken anchor check | Yes | Verifies all `#anchor` links in generated HTML resolve to actual `id` attributes in target pages |

## Post-Deploy Verification

After syncing to R2, the workflow checks that these keys exist in the bucket:

- `index.html` (home page)
- `getting-started/quick-start/index.html`
- `for-editors/overview/index.html`

If verification fails, a debug step lists the R2 bucket contents for troubleshooting.

## Running Manually

From the GitHub Actions UI:

1. Go to **Actions → Deploy Docs to CloudFlare R2**
2. Click **Run workflow**
3. Select the `main` branch
4. Click **Run workflow**

This is useful for forcing a redeploy without a code change (e.g., after configuring new secrets).
