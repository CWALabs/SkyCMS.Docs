# Branch Protection Setup for Docs Quality Gates

Use this checklist to make the docs quality workflow mandatory on pull requests.

## Target branch

- `main`

## Required status checks

Enable these checks as required:

- `Docs Quality Gates / links-and-metadata`

If the exact check name is not visible yet, run one PR that triggers the workflow first, then return and select it.

## Recommended branch protection settings

1. Open repository Settings.
2. Open Branches.
3. Edit branch protection for `main` (or create a new rule targeting `main`).
4. Enable `Require a pull request before merging`.
5. Enable `Require status checks to pass before merging`.
6. Add required check: `Docs Quality Gates / links-and-metadata`.
7. Enable `Require branches to be up to date before merging`.
8. Save changes.

## Optional hardening

- Enable `Require conversation resolution before merging`.
- Enable `Do not allow bypassing the above settings` for admins if desired.
- Add CODEOWNERS for docs paths.

## Validation

Create a test PR that modifies a markdown file and verify:

- The Docs Quality Gates workflow runs.
- The check appears as required.
- Merge is blocked when the check fails.
