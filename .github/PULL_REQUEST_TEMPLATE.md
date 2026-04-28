# Documentation Pull Request

## Summary

- Describe what changed and why.

## Scope

- [ ] Docs-only change
- [ ] Includes workflow/script changes
- [ ] Includes navigation changes (`mkdocs.yml`)

## Required Quality Gates

Run these locally before requesting review:

```powershell
./.tmp-link-check.ps1
./scripts/validate-doc-metadata.ps1
```

- [ ] Internal link/anchor check passed (`.tmp-link-check.ps1`)
- [ ] Metadata check passed (`validate-doc-metadata.ps1`)
- [ ] New or materially revised pages follow metadata schema in `for-developers/documentation-metadata-schema.md`

## Metadata and Standards Confirmation

- [ ] Page type uses one of: `Tutorial`, `How-to`, `Reference`, `Explanation`
- [ ] Required metadata fields are present for YAML-front-matter pages
- [ ] Owner and `last_reviewed` are set appropriately

## Feature Catalog Sync (when applicable)

- [ ] Updated links in `reference/features/01-08-*.md` or relevant section page
- [ ] Updated `reference/features/documentation-gaps.md` status where needed

## Validation Notes

- Paste relevant command output snippets or a short pass/fail summary.

## Reviewer Focus

- Call out any areas where you want deeper review.
