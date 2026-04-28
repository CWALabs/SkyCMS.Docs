---
canonical_title: SkyCMS Documentation Visual Style Standard (DVSS)
description: Visual and typographic standards for SkyCMS documentation, including heading hierarchy, paragraph readability, and navigation/TOC clarity.
doc_type: Reference
product_area: documentation
user_intent: apply-documentation-visual-style-standard
audience:
  - Developers
difficulty: intermediate
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# SkyCMS Documentation Visual Style Standard (DVSS)

## Summary

Visual and typographic standards for SkyCMS documentation, including heading hierarchy, paragraph readability, and navigation/TOC clarity.

## Why this standard exists

Current standards already define content types, metadata, and writing quality. This DVSS adds explicit visual rules for:

- typography,
- heading and paragraph rhythm,
- navigation hierarchy,
- table-of-contents clarity,
- accessibility-focused contrast and emphasis.

## External guidance synthesis (authoritative sources)

The DVSS is aligned to these widely respected sources:

- Microsoft Writing Style Guide: clarity-first, plain language, scannable structure.
  - [Microsoft Writing Style Guide](https://learn.microsoft.com/en-us/style-guide/welcome/)
- Google Developer Documentation Style Guide: strong heading discipline, paragraph structure, cross-linking, accessibility, and consistency hierarchy.
  - [Google Developer Documentation Style Guide](https://developers.google.com/style)
- Diataxis and Divio Documentation System: separate user intents by documentation type (Tutorial, How-to, Reference, Explanation) to improve information architecture and findability.
  - [Diataxis](https://diataxis.fr/)
  - [Divio Documentation System](https://docs.divio.com/documentation-system/)

## What those sources consistently recommend

1. Make structure obvious at a glance.
1. Keep hierarchy consistent and shallow where possible.
1. Use clear heading levels and avoid visual ambiguity between levels.
1. Write short, readable paragraphs and task-first sections.
1. Emphasize active/current navigation state clearly.
1. Prioritize accessibility and readability over decorative styling.

## DVSS rules for SkyCMS

## 1) Typography scale

Use one stable reading scale across docs pages.

| Element | Target size | Weight | Notes |
| --- | --- | --- | --- |
| H1 | 2.0rem | 700 | Page title only |
| H2 | 1.5rem | 650 | Major sections |
| H3 | 1.25rem | 600 | Subsections |
| H4 | 1.0rem | 600 | Minor subsections |
| Body text | 0.95-1.0rem | 400 | Primary reading text |
| Meta/support text | 0.8-0.875rem | 500 | Captions, helper notes |

Policy:

- Do not collapse adjacent heading levels into near-identical visual appearance.
- Keep heading contrast and weight strong enough to scan quickly.

## 2) Headings and section rhythm

- Keep heading hierarchy strictly sequential.
- Use descriptive, task-forward headings.
- Add vertical spacing so each section boundary is obvious.
- Keep heading anchors stable and human-readable.

Policy:

- Never skip from H2 directly to H4.
- Avoid one-word ambiguous headings (for example, "Overview" repeated several times on one page).

## 3) Paragraph and body text readability

- Target short paragraphs, usually 1-4 sentences.
- Keep line length readable (around 65-85 characters where possible).
- Break procedures into numbered steps.
- Use lists for scannable detail.

Policy:

- Avoid large walls of text without subheadings.
- Prefer one idea per paragraph.

## 4) Primary navigation and TOC hierarchy

For the left documentation navigation and page-level TOC:

- Parent topics must be visibly stronger than children.
- Child levels must have clear indentation and slight size/weight differentiation.
- Active page and active branch must be visually obvious (color + weight + subtle background/border cue).
- Hover and focus states must be clearly visible.

Policy:

- A reader should identify parent vs child levels in under 2 seconds.
- Do not rely only on color; use weight/spacing/indent cues too.

## 5) Link and emphasis behavior

- Links must be clearly distinguishable from body text.
- Hover states should reinforce clickability without causing layout shift.
- Active navigation state should remain visually persistent.

Policy:

- Avoid low-contrast link colors.
- Avoid underlines that appear only in some contexts and not others.

## 6) Accessibility requirements (visual)

- Maintain WCAG AA contrast targets for text and interactive states.
- Ensure keyboard focus visibility in navigation and TOC elements.
- Avoid tiny text for navigational controls.

Policy:

- Visual hierarchy must remain clear in both light and dark themes.

## Implementation mapping in SkyCMS Docs

DVSS is implemented via a dedicated stylesheet:

- assets/css/docs-visual-style.css

And enabled in MkDocs config:

- mkdocs.yml -> extra_css

## Review checklist for DVSS conformance

- [ ] Heading levels are visually distinct and structurally correct.
- [ ] Parent/child nav hierarchy is obvious.
- [ ] Active nav item is unmistakable.
- [ ] Paragraphs are short and scannable.
- [ ] Link, hover, and focus states are visible and consistent.
- [ ] Contrast remains readable in light and dark modes.

## Related standards

- [Documentation Standards Stack v1](documentation-standards-stack-v1.md)
- [Documentation Templates](documentation-templates.md)
- [Documentation PR Checklist](documentation-pr-checklist.md)
- [Documentation Metadata Schema v1](documentation-metadata-schema.md)
