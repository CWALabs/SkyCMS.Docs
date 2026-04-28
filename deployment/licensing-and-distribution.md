---
canonical_title: Licensing and Distribution
description: Licensing model, distribution requirements, and pre-release checklist for SkyCMS deployments and release builds.
doc_type: Reference
product_area: release-management
user_intent: verify-licensing-compliance-for-skycms-deployment
audience:
  - Administrators
  - DevOps Engineers
  - Release Managers
difficulty: beginner
version: current
status: draft
owner: docs-platform
last_reviewed: 2026-04-28
---

# Licensing and Distribution

## Summary

Licensing model, distribution requirements, and pre-release checklist for SkyCMS deployments and release builds.

## When to use this page

Use this guide when preparing a release, building distributable artifacts, or validating licensing compliance for SkyCMS deployments.

## Canonical legal files

This page is operational guidance. Canonical legal texts remain in repository root:

- [LICENSE-MIT](https://github.com/CWALabs/SkyCMS/blob/main/LICENSE-MIT)
- [LICENSE-GPL](https://github.com/CWALabs/SkyCMS/blob/main/LICENSE-GPL)
- [LICENSE-CKEDITOR-GPL](https://github.com/CWALabs/SkyCMS/blob/main/LICENSE-CKEDITOR-GPL)
- [NOTICE.md](https://github.com/CWALabs/SkyCMS/blob/main/NOTICE.md)
- [LICENSES-DISTRIBUTION.md](https://github.com/CWALabs/SkyCMS/blob/main/LICENSES-DISTRIBUTION.md)

## Licensing model summary

- SkyCMS source code: MIT.
- CKEditor 5: dual licensing model (GPL-2.0-or-later or commercial CKSource terms).
- Other dependencies: review third-party notices and upstream licenses.

## Release profiles

Choose one release profile for each build:

1. `oss-gpl`
2. `commercial`
3. `source-only`

### oss-gpl

Use when distributed artifacts include CKEditor under GPL path.

Required artifacts and process:

- Include GPL text and CKEditor GPL-path notice.
- Include notices and attribution files.
- Publish corresponding source for the distributed GPL-covered work.
- Avoid downstream restrictions incompatible with GPL terms.

### commercial

Use when distributed artifacts include CKEditor under commercial entitlement.

Required artifacts and process:

- Keep internal evidence of CKEditor commercial entitlement.
- Include project and third-party notices.
- Ensure release notes and package metadata do not claim GPL path for CKEditor.

### source-only

Use when shipping SkyCMS source/components without bundling CKEditor.

Required artifacts and process:

- Include MIT and notice files.
- Verify CKEditor artifacts are excluded from package output.

## Distribution decision guide

Use this simplified decision path:

1. Are you distributing binaries/images/packages outside your organization?
2. Does the distributed artifact include CKEditor?
3. If yes, which CKEditor licensing path is used for this release (`GPL` or `COMMERCIAL`)?
4. Does the release bundle include all required notices and license files for that path?

If any answer is unclear, pause release and perform compliance review.

## Per-release checklist

1. Declare profile: `oss-gpl`, `commercial`, or `source-only`.
2. Generate dependency inventory or SBOM for shipped artifacts.
3. Verify license files and notice files are present in release bundle.
4. Verify CKEditor path declaration matches shipped artifacts.
5. Archive compliance evidence with release tag (manifest, notices, profile, approvals).

## Operational notes

- This page does not replace legal advice.
- For jurisdiction-specific distribution questions, involve legal counsel before publishing artifacts.
