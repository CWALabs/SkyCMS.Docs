<!-- Audience: Developers and Documentation Maintainers -->
<!-- Type: Explanation -->
<!-- Status: Draft -->
<!-- Source: SkyCMS/Docs/Installation/DocsPublisher.md -->

# SkyCMS Docs Publisher

## When to use this page

Use this page when you want documentation content managed in a standalone repository and synchronized into SkyCMS.

## What it is

SkyCMS.DocsPublisher is a template repository that includes:

- A `Docs/` content tree.
- Import tooling under `.skycms/`.
- GitHub Actions workflow for sync/publish automation.
- Example pages and assets.

## Why use it

- Keep product code and docs content in separate repositories.
- Support independent documentation workflows.
- Reuse a proven structure for Markdown import into SkyCMS.

## Next steps

1. Clone the SkyCMS.DocsPublisher repository.
2. Follow repository quick-start and README instructions.
3. Configure repository secrets for your target environment.
4. Trigger or commit to run the publishing workflow.

## Related guides

- [overview.md](overview.md)
- [post-installation.md](post-installation.md)
- [../deployment/publishing-workflow.md](../deployment/publishing-workflow.md)
