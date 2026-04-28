---
canonical_title: SkyCMS Docs Publisher
description: When to use SkyCMS.DocsPublisher and how it supports standalone documentation synchronization into SkyCMS.
doc_type: Explanation
product_area: installation
user_intent: adopt-skycms-docspublisher-for-standalone-documentation
audience:
  - Developers
  - Documentation Maintainers
difficulty: intermediate
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# SkyCMS Docs Publisher

## Summary

Use this page when you want documentation content managed in a standalone repository and synchronized into SkyCMS.

## What it is

SkyCMS.DocsPublisher is a template repository that includes:

- A `Docs/` content tree.
- Import tooling under `.skycms/`.
- GitHub Actions workflow for sync/publish automation.
- Example pages and assets.

## DocsPublisher runtime topology

```mermaid
%%{init: {"theme":"base","themeVariables":{"primaryColor":"#eef6ff","primaryTextColor":"#0f172a","primaryBorderColor":"#2563eb","lineColor":"#334155","secondaryColor":"#f8fafc","tertiaryColor":"#ffffff","fontFamily":"Segoe UI, Arial, sans-serif"}}}%%
flowchart LR
  Repo[DocsPublisher repository] --> Content[Docs and assets]
  Repo --> Tooling[.skycms import tooling]
  Repo --> Workflow[GitHub Actions workflow]
  Workflow --> SkyCMS[SkyCMS import endpoint or sync process]
  Content --> SkyCMS
  SkyCMS --> Site[Published documentation site]
```

## Why use it

- Keep product code and docs content in separate repositories.
- Support independent documentation workflows.
- Reuse a proven structure for Markdown import into SkyCMS.

## Verification

DocsPublisher is set up correctly when:

- content is committed in the standalone docs repository,
- required secrets are configured,
- sync or publish workflow runs successfully,
- published documentation appears in the target SkyCMS environment.

## Next steps

1. Clone the SkyCMS.DocsPublisher repository.
2. Follow repository quick-start and README instructions.
3. Configure repository secrets for your target environment.
4. Trigger or commit to run the publishing workflow.

## Related guides

- [Installation Overview](overview.md)
- [Post-Installation Configuration](post-installation.md)
- [Publishing Workflow](../deployment/publishing-workflow.md)
