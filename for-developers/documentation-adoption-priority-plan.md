---
canonical_title: SkyCMS Documentation Adoption Priority Plan
description: Adoption-first documentation execution plan prioritizing installation/configuration and first-website-build success.
doc_type: Explanation
product_area: documentation
user_intent: prioritize-doc-work-for-adoption
audience:
  - Developers
difficulty: intermediate
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# SkyCMS Documentation Adoption Priority Plan

## Summary

Adoption-first documentation execution plan prioritizing installation/configuration and first-website-build success.

## Adoption principle

If users cannot install and configure SkyCMS quickly, they never reach product value.

If users cannot build a working site quickly after setup, they do not continue usage.

Priority order:

1. Installation and configuration journey.
1. Website-building journey.
1. Operational maturity and optimization.

## Success metrics

Track these metrics in priority order:

1. First-try install success rate.
1. Median time to successful setup completion.
1. Median time from setup complete to first published page.
1. Drop-off rate between setup completion and first publish.

## Adoption journey map

## Journey A: Install and configure (highest priority)

Primary outcome:

- user reaches a healthy, configured SkyCMS instance.

Primary pages:

- [installation/overview.md](../installation/overview.md)
- [installation/setup-wizard.md](../installation/setup-wizard.md)
- [installation/minimum-required-settings.md](../installation/minimum-required-settings.md)
- [configuration/overview.md](../configuration/overview.md)
- [installation/post-installation.md](../installation/post-installation.md)
- [deployment/overview.md](../deployment/overview.md)

## Journey B: Build and publish a website (second priority)

Primary outcome:

- user creates a page, publishes it, and verifies output.

Primary pages:

- [getting-started/quick-start.md](../getting-started/quick-start.md)
- [for-site-builders/overview.md](../for-site-builders/overview.md)
- [for-site-builders/layouts.md](../for-site-builders/layouts.md)
- [for-site-builders/templates.md](../for-site-builders/templates.md)
- [for-editors/visual-editor-quickstart.md](../for-editors/visual-editor-quickstart.md)
- [for-editors/page-builder-quickstart.md](../for-editors/page-builder-quickstart.md)
- [for-editors/publishing-modes.md](../for-editors/publishing-modes.md)

## Journey C: Operate and scale (third priority)

Primary outcome:

- user can release safely and troubleshoot production issues.

Primary pages:

- [deployment/cicd-pipelines.md](../deployment/cicd-pipelines.md)
- [deployment/publishing-workflow.md](../deployment/publishing-workflow.md)
- [reference/troubleshooting.md](../reference/troubleshooting.md)
- [reference/faq.md](../reference/faq.md)

## Re-ranked execution queue

## Wave 0: Already improved in this cycle

- [getting-started/quick-start.md](../getting-started/quick-start.md)
- [deployment/overview.md](../deployment/overview.md)
- [for-developers/overview.md](./overview.md)

## Wave 1: Immediate adoption blockers

1. [getting-started/what-is-skycms.md](../getting-started/what-is-skycms.md)
1. [deployment/docker.md](../deployment/docker.md)
1. [installation/overview.md](../installation/overview.md) (adoption-focused rewrite and clearer decision paths)
1. [configuration/overview.md](../configuration/overview.md) (decision-first guidance and setup checkpoints)

## Wave 2: Time-to-first-website acceleration

1. [for-site-builders/overview.md](../for-site-builders/overview.md) (intent-first start paths)
1. [for-site-builders/layouts.md](../for-site-builders/layouts.md) (first-usable layout path)
1. [for-site-builders/templates.md](../for-site-builders/templates.md) (first-template publish path)
1. [for-editors/visual-editor-quickstart.md](../for-editors/visual-editor-quickstart.md) (publish-first flow)
1. [for-editors/page-builder-quickstart.md](../for-editors/page-builder-quickstart.md) (publish-first flow)
1. [for-editors/publishing-modes.md](../for-editors/publishing-modes.md) (simple mode decision tree)

## Wave 3: Confidence and operational trust

1. [deployment/cicd-pipelines.md](../deployment/cicd-pipelines.md)
1. [deployment/publishing-workflow.md](../deployment/publishing-workflow.md)
1. [reference/troubleshooting.md](../reference/troubleshooting.md)
1. [reference/faq.md](../reference/faq.md)

## Deferred backlog (track, do later)

1. Finish docs CI hardening by enforcing Docs Quality Gates as required status checks.
1. Sweep documentation for plain-text reading paths or recommended doc lists and convert them to direct linkable list items where appropriate.
1. Finish all remaining documentation standardization and structural cleanup work that is well-suited to GPT-led repo editing.
1. Run a dedicated editorial voice and readability pass after structural and standards work is complete.
1. Run a broad cross-doc review with Gemini after the editorial pass to identify remaining consistency, readability, and coverage gaps.

## Page-level standards for adoption-critical docs

Every adoption-critical page must have:

1. one clear outcome statement at top,
1. prerequisites that are complete and testable,
1. numbered procedural steps,
1. explicit verification criteria,
1. related links to the next step in the user journey.

## Review cadence for adoption-critical pages

- Review every 30 days while adoption is the primary strategic goal.
- Update `last_reviewed` on every material revision.
- Treat broken install/build paths as top-priority documentation incidents.

## Operating decision

Until adoption goals are met, use this plan as the default sort order for documentation backlog and rewrite work.
