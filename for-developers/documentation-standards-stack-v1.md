# SkyCMS Documentation Standards Stack v1

This standard defines how SkyCMS documentation is structured, written, reviewed, and improved.

## Purpose

- Reduce path bouncing between role sections.
- Improve first-try findability.
- Keep documentation consistent and current.
- Create a repeatable docs workflow for product teams.

## Scope

This standard applies to all documentation in SkyCMS.Docs.

---

## Layer 1: Information architecture standard

- Primary model: intent-first, role-second.
- Keep role sections, but treat them as secondary entry paths.
- Limit navigation depth to 3 levels where possible.
- Each page must include at least one parent path and two related links.

Policy:

- Do not add new top-level sections without taxonomy review.
- Avoid audience-only labels unless user intent is obvious.

## Layer 2: Content type model

Each page has one primary type:

- Tutorial
- How-to guide
- Reference
- Explanation

Policy:

- A page must declare exactly one primary type.
- Split mixed pages when one type no longer dominates.

## Layer 3: Page structure and template standard

Required page header metadata:

- Title
- One-sentence summary
- Page type
- Product area
- Version scope
- Owner
- Last reviewed date

Required sections by type:

- Tutorial: Outcome, Prerequisites, Steps, Checkpoints, Next steps.
- How-to: Goal, Prerequisites, Procedure, Verification, Troubleshooting, Related links.
- Reference: Overview, Fields/Options/Tables, Examples, Constraints, Related links.
- Explanation: Context, How it works, Decisions and tradeoffs, Related links.

Policy:

- Use descriptive headings.
- Use numbered steps for procedures.
- Do not use generic link text such as "click here".

## Layer 4: Writing and style standard

- Write in active voice.
- Prefer plain language.
- Define uncommon terms on first use.
- Use glossary-approved terminology.
- Use inclusive language.

Title conventions:

- Task pages start with an action verb.
- Concept and reference pages use clear noun phrases.

## Layer 5: Taxonomy and metadata standard

Required metadata fields:

- doc_type
- product_area
- user_intent
- audience
- difficulty
- version
- status (active, deprecated, archived)
- owner
- last_reviewed

Policy:

- Do not publish without required metadata.
- Deprecated pages must include replacement guidance and a sunset date.

## Layer 6: Navigation, linking, and search standard

- Keep sibling labels parallel and specific.
- Every task page links to at least one concept page and one reference page.
- Every reference page links to at least one how-to page.
- Default search scope is full site.
- Maintain synonym mappings for common alternate terms.

Policy:

- Validate new navigation labels with user language, not internal-only language.
- Run periodic tree testing for top user workflows.

## Layer 7: Accessibility and inclusive content standard

- Target WCAG 2.2 AA across docs pages.

Requirements:

- Correct heading hierarchy.
- Meaningful link text.
- Alt text for informative images.
- Keyboard-friendly interactions.
- Avoid image-only instructions when text alternatives are possible.

## Layer 8: Governance and workflow standard

Roles:

- Documentation owner (per product area)
- Technical reviewer
- Editorial reviewer
- Release approver

Workflow:

- Feature PRs require docs impact review.
- Behavior changes require docs updates.
- Review high-traffic pages every 90 days.
- Review all active pages every 180 days.

Deprecation workflow:

- Mark deprecated.
- Add migration path.
- Set archive date.
- Add redirects when archived.

## Layer 9: Quality gates and measurement standard

Pre-merge quality gates:

- Broken links: zero
- Required metadata present
- Heading/title lint checks pass
- Accessibility checks pass

Post-publish metrics:

- Search success rate
- Top failed search queries
- Time to first useful click
- Bounce rate on top landing pages
- Stale page count
- Duplicate topic count

## 90-day targets

- Reduce top 20 failed search queries by 30 percent.
- Increase first-click success on key tasks by 20 percent.
- Reach 100 percent owner and review-date coverage for active pages.

## Definition of done for v1

- Standard is approved and published.
- Templates are required for new and updated docs.
- Metadata is present on active pages.
- Intent-first entry paths are live.
- Baseline reporting is active.
