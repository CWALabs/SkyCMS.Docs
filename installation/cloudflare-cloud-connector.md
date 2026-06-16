---
canonical_title: Cloudflare Cloud Connector
description: Route SkyCMS storage traffic through Cloudflare Cloud Connector instead of building the full edge rule set manually.
doc_type: How-to
product_area: installation
user_intent: configure-cloudflare-cloud-connector-for-skycms-storage
audience:
	- Developers
	- DevOps
difficulty: intermediate
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# Cloudflare Cloud Connector

## Summary

Use this guide when you want Cloudflare to route to object storage using Cloud Connector instead of manually creating full edge routing rules.

## What it does

Cloud Connector simplifies storage routing by automatically handling host header and TLS adjustments for supported providers.

## Prerequisites

- Cloudflare account with Cloud Connector availability.
- Public cloud storage bucket.
- Proxied domain in Cloudflare.

### Values to collect before you start

Keep these values available for copy and paste:

- Site hostname (example: `www.example.com`)
- Cloudflare zone name (example: `example.com`)
- R2 bucket name
- Cloudflare account ID
- Bucket endpoint (example: `<bucket>.<account-id>.r2.cloudflarestorage.com`)
- Optional path prefix if you are not mapping the entire site (example: `/docs`)

## Outcome

After completing this guide, Cloudflare should be able to route requests to the backing storage target with less manual edge-rule work.

## Setup flow

1. Create Cloud Connector rule in Cloudflare dashboard.
2. Select provider and bucket target.
3. Add cache rule for content caching policy.
4. Add URL rewrite rules if path mapping is needed.
5. Validate behavior with production-like requests.

---

## Step 1: Confirm storage target and DNS baseline

1. In Cloudflare dashboard, open **R2 Object Storage**.
2. Open your target bucket.
3. Confirm the bucket contains at least:
	- `index.html`
	- a static asset (for example `assets/site.css`)
4. Confirm your site hostname is proxied in Cloudflare DNS.
5. If using a custom domain on R2, verify that domain is active.

Expected result:
- Cloudflare can reach your bucket content by endpoint or bound custom domain.

---

## Step 2: Create Cloud Connector route

1. Open Cloudflare dashboard for your zone.
2. Open **Cloud Connector**.
	- If you do not see it in navigation, use Cloudflare dashboard search for `Cloud Connector`.
3. Click **Create connector** (or **Create route**, depending on UI label).
4. Set source/request match values:
	- Hostname: `www.example.com`
	- Path match: `/` for whole-site mapping, or a prefix such as `/docs/*`
5. Set destination/origin values:
	- Provider: `Cloudflare R2` (or `S3-compatible` if your UI groups R2 there)
	- Bucket/target: your bucket name
	- Origin endpoint host: `<bucket>.<account-id>.r2.cloudflarestorage.com`
6. Set connection options:
	- TLS to origin: enabled
	- Host header behavior: use destination/origin host unless you have a custom-domain requirement
7. Save and deploy.

Expected result:
- Requests for the matched host/path are routed by Cloudflare to your storage target.

---

## Step 3: Add cache rule for routed content

Cloud Connector handles routing. Use cache rules to control freshness and performance.

1. Open **Rules -> Cache Rules**.
2. Click **Create rule**.
3. Rule name: `cache-r2-static-content`.
4. Match expression example:

```text
http.host eq "www.example.com"
```

5. Cache action recommendations:
	- Cache status: eligible
	- Edge TTL for HTML: low (example: 30 to 120 seconds)
	- Edge TTL for versioned static assets: higher (example: 1 hour to 1 day)
6. Save and deploy.

Expected result:
- Routed responses are cached according to your policy.

---

## Step 4: Add optional URL rewrite rules for SkyCMS

Cloud Connector does not automatically apply site-root or directory index rewrites in all layouts. Add these rules for SkyCMS support.

Use these exact rule recipes from Edge Hosting:

- Root rewrite (`/` -> `/index.html`): [Cloudflare Edge Hosting - Step 4](cloudflare-edge-hosting.md#step-4-add-rewrite-rule-for-root-path-to-indexhtml)
- Directory rewrite (`/path/` -> `/path/index.html`): [Cloudflare Edge Hosting - Mixed content scenario](cloudflare-edge-hosting.md#mixed-content-scenario-add-directory-rewrite-before-root-rewrite)
- HTTP to HTTPS redirect: [Cloudflare Edge Hosting - Step 5](cloudflare-edge-hosting.md#step-5-add-http-to-https-redirect-rule)

Rule order when combining with Cloud Connector:

1. Directory index rewrite (if used)
2. Root rewrite
3. HTTP to HTTPS redirect

---

## Step 5: Validate with production-like requests

Run these checks before go-live.

1. Open `https://www.example.com/index.html` and confirm 200.
2. Open `https://www.example.com/` and confirm expected content.
3. If directory rewrites are enabled, open a directory path ending with `/` and confirm it resolves.
4. Open an HTTP URL and confirm one redirect to HTTPS.
5. Inspect Cloudflare analytics/logs to confirm requests are routed through Cloud Connector.
6. Confirm there are no redirect loops and no unexpected 404 responses.

PowerShell verification examples:

```powershell
curl.exe -I https://www.example.com/
curl.exe -I http://www.example.com/
curl.exe -I https://www.example.com/some/path/
```

---

## Troubleshooting

If content does not resolve correctly:

1. Confirm connector source host/path exactly matches request host/path.
2. Confirm destination bucket endpoint is correct.
3. Confirm rewrite rules are present and ordered correctly.
4. Confirm DNS record is proxied through Cloudflare.
5. Confirm origin TLS and host header settings match your destination requirements.
6. Temporarily bypass cache when testing rule changes.

## Cloud Connector vs manual edge rules

- Cloud Connector: faster setup, less boilerplate.
- Manual rules: more direct control over path and host-specific logic.

For manual rule configuration patterns, see [Cloudflare Edge Hosting](cloudflare-edge-hosting.md).

## Verification

This setup is complete when production-like requests resolve through Cloudflare correctly and the expected content paths map to the target bucket without host or TLS errors.

## Related guides

- [Cloudflare Edge Hosting](cloudflare-edge-hosting.md)
- [Cloudflare R2 Storage](../configuration/storage/cloudflare-r2.md)
