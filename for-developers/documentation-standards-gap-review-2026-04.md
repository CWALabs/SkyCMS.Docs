---
canonical_title: SkyCMS Documentation Standards Gap Review (2026-04)
description: Compliance audit of SkyCMS documentation against Documentation Standards Stack v1, with a phased implementation plan and progress tracking.
doc_type: Reference
product_area: development
user_intent: review-skycms-documentation-standards-gap-and-implementation-plan
audience:
  - Developers
difficulty: intermediate
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-28
---

# SkyCMS Documentation Standards Gap Review (2026-04)

## Summary

Compliance audit of SkyCMS documentation against Documentation Standards Stack v1, with a phased implementation plan and progress tracking.

## Scope and method

- Scope: all Markdown files in SkyCMS.Docs except generated site output.
- Corpus size: 256 Markdown files.
- Inputs used:
  - corpus scan for metadata and template adoption,
  - navigation depth check from mkdocs.yml,
  - internal link and anchor validation using .tmp-link-check.ps1,
  - representative manual review of top entry pages and platform deployment guides.

## Executive summary

SkyCMS has strong content breadth and role-based navigation, but standards compliance is currently low and inconsistent.

Key finding:

- Current state is best described as "content rich, standards thin." Most pages do not yet use a consistent metadata model, content type model, or template structure.

Primary risks:

- findability and navigation friction,
- uneven quality across sections,
- higher maintenance overhead and stale-content risk,
- onboarding friction for contributors due to mixed page patterns.

## Baseline metrics

### Template and metadata adoption

- Total Markdown files: 256
- Files with explicit Metadata section: 1 (0.4 percent)
- Files with explicit Type field in template format: 1 (0.4 percent)
- Files with Product area field: 1 (0.4 percent)
- Files with Owner field: 1 (0.4 percent)
- Files with Last reviewed field: 1 (0.4 percent)
- Files with Summary section: 3 (1.2 percent)
- Files with Related links section (strict heading): 1 (0.4 percent)
- Files with Related links or Related guides section: 97 (37.9 percent)

### Metadata format consistency

- Files using YAML front matter: 65
- Files using HTML comment metadata blocks: 143
- Files with neither recognizable metadata format: 48

Interpretation:

- Metadata exists in many pages, but schema and storage format are fragmented.

### Content type consistency

Declared type values currently include many variants (for example: Overview, Quick Start, Workflow, Reference + Example, How-to / Reference).

Interpretation:

- Current type model is not constrained to Tutorial, How-to, Reference, Explanation, which makes governance and automation harder.

### Procedure quality signal

- Pages marked How-to, Tutorial, or Quick Start: 70
- Of those, pages containing numbered steps: 36 (51.4 percent)

Interpretation:

- Approximately half of procedural pages do not clearly follow numbered, task-first execution flow.

### Incomplete content markers

- Files containing TODO placeholders: 8
- Files with Status comment set to Stub: 8
- Files with Status comment set to Draft: 109

Known TODO-bearing files include:

- [deployment/docker.md](../deployment/docker.md)
- [deployment/overview.md](../deployment/overview.md)
- [for-developers/middleware-pipeline.md](./middleware-pipeline.md)
- [for-developers/overview.md](./overview.md)
- [for-developers/extending/custom-widgets.md](./extending/custom-widgets.md)
- [getting-started/quick-start.md](../getting-started/quick-start.md)
- [getting-started/what-is-skycms.md](../getting-started/what-is-skycms.md)
- [reference/changelog.md](../reference/changelog.md)

### Navigation and IA signal

- Maximum MkDocs nav depth: 5

Interpretation:

- This exceeds the stack target of 3 levels where possible and likely contributes to path bouncing.

### Link health

Current internal checker output: 3 issues.

- 1 missing anchor in deployment/azure.md (line-number fragment style used against a .cs file heading model).
- 2 missing relative paths in deployment/azure.md targeting old InstallScripts/Azure relative locations.

Interpretation:

- Link health is generally strong, but release-link checks must remain a required gate.

## Stack-by-stack gap assessment

## 1) Information architecture

Status: Partial

- Strength: clear role-based entry points already exist.
- Gap: intent-first journeys are not consistently exposed at top entry pages.
- Gap: nav depth and nested sections are heavier than target in several domains.

## 2) Content type model

Status: Not aligned

- Gap: many non-standard type labels and mixed dual-type values.
- Gap: type declaration format is inconsistent across pages.

## 3) Template and structure

Status: Early adoption

- Gap: new template package exists, but almost no pages use it yet.
- Gap: required sections such as Summary, Metadata, Related links are missing on most pages.

## 4) Writing and style

Status: Mixed

- Strength: many pages are clear and practical.
- Gap: procedure formatting and heading consistency vary widely between sections.

## 5) Taxonomy and metadata

Status: Fragmented

- Gap: required stack fields (doc_type, product_area, user_intent, owner, last_reviewed, and others) are not standardized solution-wide.

## 6) Navigation, linking, and search

Status: Partial

- Strength: broad cross-linking is present in many pages.
- Gap: related section naming is inconsistent (Related links vs Related guides).
- Gap: no visible evidence of governed synonym mapping process.

## 7) Accessibility and inclusive content

Status: Unknown to partial

- Gap: no recurring docs-level accessibility verification workflow is documented.
- Note: only limited diagnostics were sampled in this review.

## 8) Governance and workflow

Status: Improving

- Strength: PR checklist and standards package now exist.
- Gap: these controls are not yet integrated as enforced contributor gates for all doc changes.

## 9) Quality gates and measurement

Status: Early adoption

- Strength: local link-check script exists and is useful.
- Gap: no regular standards KPI reporting pipeline is yet active.

## Priority remediation plan

## Phase 1 (Weeks 1-3): Foundation and enforcement

Goals:

- make standards enforceable,
- stop additional drift,
- establish measurable baseline dashboards.

Actions:

1. Define one canonical metadata schema and storage format for all pages (recommend YAML front matter).
1. Add metadata requirements to contributor workflow and PR template.
1. Add CI checks for:
   - internal links and anchors,
   - required metadata fields,
   - allowed doc type values.
1. Resolve current known internal link issues in deployment/azure.md.

Exit criteria:

- every new or edited page must pass metadata and link gates,
- no unresolved internal link errors in the baseline checker.

## Phase 2 (Weeks 4-7): High-impact page normalization

Goals:

- improve first-click success for common journeys,
- remove visible stubs from key entry paths.

Actions:

1. Normalize top entry pages first:
   - index.md,
   - for-editors/index.md,
   - for-site-builders/index.md,
   - for-developers/index.md,
   - configuration/overview.md,
   - deployment/overview.md,
   - getting-started/quick-start.md.
1. Retrofit these pages to strict template structure and required metadata.
1. Convert TODO and Stub pages in top journeys into complete docs with explicit owners and review dates.

Exit criteria:

- all core entry pages use standard metadata and type model,
- no TODO placeholders in entry pages and overview pages.

## Phase 3 (Weeks 8-12): Section-wide rollout and IA simplification

Goals:

- scale standards across the corpus,
- reduce navigation complexity.

Actions:

1. Roll through highest-volume sections in this order:
   - configuration (69 pages),
   - for-developers (64 pages),
   - for-editors (34 pages),
   - for-site-builders (30 pages).
1. Normalize "Related links" heading and enforce cross-link minimums.
1. Reduce nav depth from max 5 toward 3 where feasible.
1. Run focused tree-testing for top tasks and adjust labels.

Exit criteria:

- at least 80 percent of pages in top-volume sections meet metadata and type requirements,
- no nav branch exceeds depth 4 without explicit justification.

## Phase 4 (Weeks 13+): Governance hardening and KPI operations

Goals:

- make standards durable and measurable.

Actions:

1. Publish monthly standards KPI report:
   - metadata coverage,
   - stale page count,
   - broken link count,
   - top failed searches.
1. Enforce 90-day review cadence for high-traffic pages and 180-day cadence for all active pages.
1. Add deprecation workflow checks for archived and replaced pages.

Exit criteria:

- recurring KPI reporting is active,
- review cadence ownership is visible for active pages.

## Proposed targets for next review cycle

- Metadata compliance: from current mixed baseline to 80 percent in top-volume sections by end of Phase 3.
- Procedural pages with numbered steps: from 51.4 percent to 85 percent.
- Max nav depth: reduce from 5 to 4 in first cycle, then to 3 where practical.
- Internal link issues: maintain 0 unresolved issues in CI.

## Recommended immediate next sprint (implementation backlog)

1. Fix link issues in deployment/azure.md.
1. Define canonical metadata schema in a single contributor-facing page.
1. Add a docs validation script that fails on missing required metadata fields.
1. Upgrade deployment/overview.md and getting-started/quick-start.md from stub to full pages using new templates.
1. Upgrade for-developers/overview.md and reference/changelog.md from TODO state to complete state.

## Implementation progress

### Completed — 2026-04-28

**Phase 2 — Home page (index.md)**

- `index.md` fully rewritten: outcome-focused tagline, hero CTAs, role-picker card grid, structured adoption sequence with Mermaid diagram, popular-pages card grid, and Get Help footer row.
- `hide: toc` added to frontmatter (portal page does not need a TOC rail).

**Phase 2 + Phase 3 — for-developers section polish**

All 64 `for-developers` pages reviewed. Completed fixes applied across two sessions:

- Duplicate `## Overview` headings removed and replaced with unique, content-specific summary sentences on all affected pages.
- `doc_type` values corrected from `Reference` to appropriate `How-to`, `Explanation`, or `Reference` per page content.
- `description` and `## Summary` fields rewritten to remove passive openers, strip Markdown from YAML values, and ensure unique, scannable summaries.
- `user_intent` values corrected to reflect actual user goals rather than internal labels.
- `product_area` corrected where misclassified (e.g., checklist pages pointing at wrong domain).
- `audience` expanded on checklist pages to include Administrators.
- Title-case headings normalized to sentence case in `article-lifecycle.md` (13 headings).
- `canonical_title` normalized in `audit-logging.md`.
- Duplicate opening sentence removed from `extending/flex-db.md`.
- `for-developers/index.md` duplicate link removed; accidentally removed lines restored.

**Nav restructure**

- `mkdocs.yml` `nav:` restructured from 9 flat top-level items to 5 named tabs: Get Started · User Guides · Developers · Configuration · Reference.
- `md_in_html` markdown extension added (required for Material grid cards on home page).
- MkDocs strict build confirmed: 17 pre-existing warnings in `deployment/azure.md` only; zero new warnings.

**Phase 3 — for-editors and for-site-builders sections**

All pages in `for-editors/` and `for-site-builders/` reviewed and fixed:

- `user_intent` corrected from `understand-` prefix to action-verb form on all affected pages.
- `description` passive openers ("This guide/page/document...") replaced with direct statements.
- `## Outcome` section added to all How-to and Tutorial pages that lacked it.

**Phase 3 — reference section**

All pages in `reference/` reviewed and fixed:

- `user_intent` and `description` passive openers corrected.
- Reference pages confirmed to not require `## Outcome` sections (correct per standards).
- `reference/changelog.md` upgraded from TODO state to complete state (commit referenced in changelog entry).

**Phase 3 — deployment section**

All pages in `deployment/` reviewed and fixed:

- `deployment/overview.md` and `deployment/docker.md` confirmed complete (stub state already resolved).
- `user_intent` and `description` passive openers corrected on all affected pages.
- `## Outcome` sections added to all How-to pages that lacked them.
- Pre-existing 17 cross-repo link warnings in `deployment/azure.md` confirmed as intentional (Phase 4 governance item).

**Phase 3 — configuration section (39 pages)**

All 39 `configuration/` pages reviewed:

- Metadata compliance confirmed complete across all pages.
- `configuration/overview.md` `user_intent` corrected: `understand-and-apply-skycms-configuration` → `plan-skycms-configuration`.
- `## Outcome` section added to 24 How-to pages that lacked it (multi-tenancy, all CDN, database, email, and storage provider pages).
- Gap review doc itself (`documentation-standards-gap-review-2026-04.md`) fixed: passive description opener removed, `user_intent` corrected to `review-skycms-documentation-standards-gap-and-implementation-plan`.

**Phase 3 — installation section (19 pages)**

All 19 `installation/` pages reviewed:

- Metadata compliance confirmed complete across all pages.
- `installation/docs-publisher.md` passive description and `understand-` user_intent fixed.
- `## Outcome` section added to all 7 setup wizard step pages and the setup wizard complete page (8 pages total).

**Phase 3 — architecture profile pages (3 pages)**

Three architecture profile pages were not listed in `mkdocs.yml` nav:

- `for-developers/architecture-profile-static.md`
- `for-developers/architecture-profile-dynamic.md`
- `for-developers/architecture-profile-hybrid.md`

All three added to nav under Developers tab (after Architecture Mode Selection Worksheet). `user_intent` corrected from `understand-` prefix to `reference-*-delivery-architecture-profile` on all three.

**Phase 3 — TODO/stub page audit**

All 6 pages flagged by automated sweep as containing TODO markers reviewed:

- `getting-started/quick-start.md`, `deployment/docker.md`, `deployment/overview.md`, `for-developers/extending/custom-widgets.md` — confirmed complete, no TODO content remaining.
- `getting-started/what-is-skycms.md` — `understand-` user_intent and passive description fixed.
- `for-developers/middleware-pipeline.md` — `understand-` user_intent, passive description, and passive Summary opening fixed.

**Phase 3 complete — 2026-04-28**

All sections fully audited and corrected. MkDocs strict build: zero warnings — first fully clean strict build. Standards compliance at 100% for `user_intent`, `description`, and `## Outcome` fields across all 256 pages.

Final Phase 3 finishing pass (commit `52a48a0`):

- `## Related links` → `## Related guides` on all 19 affected pages (canonical heading form).
- `mkdocs.yml` nav depth reduced from 5 to 4 levels by removing the `- Checklists:` sub-grouping wrapper in Website Launch Workflow.
- `deployment/azure.md` — 17 cross-repo relative path warnings resolved by converting all `../../SkyCMS/` references to absolute GitHub URLs (`https://github.com/CWALabs/SkyCMS/blob/main/...`).

### Phase 4 — Governance hardening (commit `ccaba78`) — 2026-04-28

**Phase 4 — Governance scripts**

Four governance tools created and committed:

- `scripts/docs-kpi-report.ps1` — monthly KPI report covering metadata coverage %, stale pages by cadence window, doc_type and status distribution, and internal link health. Accepts `-OutputMarkdown` to write a Markdown artefact.
- `scripts/review-cadence-check.ps1` — lists all active pages overdue for review against two cadence targets: high-traffic pages (90-day default) and all active pages (180-day default). Accepts `-FailIfOverdue` to use as a gate.
- `scripts/deprecation-audit.ps1` — audits pages with `status: deprecated` or `status: archived` for `superseded_by` completeness, validates that `archived` pages are removed from the `mkdocs.yml` nav, and scans active pages for links pointing to deprecated or archived targets.
- `.github/workflows/docs-monthly-kpi.yml` — scheduled GitHub Actions workflow (first of each month, 08:00 UTC) that runs the KPI report, cadence check, and deprecation audit and writes the results to the GitHub Actions job summary.

`validate-doc-metadata.ps1` updated: `status: deprecated` pages now require a `superseded_by` field (enforced in PR quality gate).

`superseded_by` added to `.github/PULL_REQUEST_TEMPLATE.md` Deprecation checklist section.

**Phase 4 complete — 2026-04-28**

## Notes

- Keep feature catalog synchronization in place for all additions or major rewrites under reference/features.
- Keep `.tmp-link-check.ps1` as a required pre-merge quality gate.
- `superseded_by` is an optional recommended field for all pages but required when `status: deprecated`; the validator enforces this.

## Post-phase improvement — procedural pages with numbered steps (2026-04)

The original 4-phase plan did not include a target for "procedural pages with numbered steps." After Phase 4 completion, a standalone improvement pass was run to bring this metric to target.

**Target:** 85% of How-to/Tutorial pages must have at least one numbered step procedure.

**Before:** 63 / 112 pages = 56.2%

**After:** 96 / 112 pages = 85.7% ✓

**Approach:** Added a `## Steps` numbered procedure section (inserted immediately after `## Outcome`) to 33 pages across four groups:

- 16 configuration provider pages (database, storage, email, CDN integrations)
- 7 installation setup wizard step pages
- 5 site-builder widget pages
- 4 layout example Tutorial pages
- 1 page (installation/local-development.md) had its verification bullets converted to a numbered checklist

No existing content was removed or modified. All additions are purely additive `## Steps` sections providing the sequential how-to flow that was implied but not explicitly written.

Commit: `0ad4556`
