---
canonical_title: SkyCMS Documentation Metadata Schema v1
description: Required YAML front matter schema and validation rules for SkyCMS documentation pages.
doc_type: Reference
product_area: documentation
user_intent: apply-documentation-metadata-schema
audience:
  - Developers
difficulty: intermediate
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# SkyCMS Documentation Metadata Schema v1

## Summary

Required YAML front matter schema and validation rules for SkyCMS documentation pages.

## Canonical format

Place this block at the top of each page.

```yaml
---
canonical_title: Deploy to Azure
description: Provision and validate SkyCMS on Azure App Service using official deployment scripts.
doc_type: How-to
product_area: deployment
user_intent: deploy-skycms-to-azure
audience:
  - DevOps
  - Platform Engineers
difficulty: intermediate
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---
```

## Required fields

- canonical_title
- description
- doc_type
- product_area
- user_intent
- audience
- difficulty
- version
- status
- owner
- last_reviewed

## Field rules

## canonical_title

- Human-readable page title.
- Must be non-empty.

## description

- One-sentence summary for search previews and AI retrieval.
- Must be non-empty.

## doc_type

Allowed values:

- Tutorial
- How-to
- Reference
- Explanation

## product_area

- Logical product surface such as deployment, configuration, editing, api, architecture.
- Must be non-empty.

## user_intent

- Primary user goal written as a concise slug, for example configure-sqlite-storage.
- Must be non-empty.

## audience

- YAML list of reader roles.
- At least one value required.

## difficulty

Allowed values:

- beginner
- intermediate
- advanced

## version

- Version scope such as current, v4, or v4-v5.
- Must be non-empty.

## status

Allowed values:

- draft
- active
- deprecated
- archived

## owner

- Team or individual accountable for the page.
- Must be non-empty.

## last_reviewed

- Date format must be yyyy-mm-dd.

## Migration guidance

- Legacy HTML comment metadata can remain temporarily for provenance.
- YAML front matter is the source of truth for validation.
- For existing pages, apply this schema when a page is materially revised.

## Validation

CI validates changed markdown files with:

- scripts/validate-doc-metadata.ps1
- .tmp-link-check.ps1
