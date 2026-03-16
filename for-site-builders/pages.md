<!-- Audience: Designers and Front-End Developers -->
<!-- Type: How-to -->
<!-- Status: Draft -->
<!-- Source: SkyCMS/Docs/ContentCreation-QuickStart.md -->

# Pages

## When to use this page

Use this guide when you need to:

- create new page instances from templates,
- validate page composition and publish readiness,
- diagnose page-level issues after template or layout changes.

## Create a page

Pages are concrete content instances built from templates and rendered in layouts.

Standard creation flow:

1. Start from the page creation entry point.
2. Set title and URL/path.
3. Choose an appropriate template.
4. Create the page and open it in Page Editor.
5. Add and format content in the template's editable regions.

Use templates by default; start from blank only when a page is truly one-off.

## Select template and layout

Selection strategy:

- Layout controls the site-wide shell.
- Template controls the page-level content structure.

When selecting:

- choose the layout family that matches section/site context,
- choose the template pattern that matches the content intent,
- avoid using highly specialized templates as general defaults.

For new sections:

1. Validate layout fit first.
2. Create or adjust template.
3. Create page instances from that template.

Related docs:

- [Layouts](./layouts.md)
- [Templates](./templates.md)

## Structure content sections

For reliable authoring and long-term maintenance:

- keep heading hierarchy consistent,
- separate summary/intro from long body content,
- use media blocks with clear captions/alt text,
- avoid placing mission-critical text in decorative components.

Recommended page structure baseline:

1. Title region
2. Intro/summary region
3. Main body region
4. Supporting media or CTA region

When handing pages to editors, include notes about:

- intended voice/length,
- required fields/regions,
- constraints for hero/media components.

## Publish and verify

Publishing paths:

- Publish now for immediate go-live.
- Schedule for coordinated releases.

Verification checklist after publish:

- page resolves on expected URL,
- navigation links point correctly,
- layout and template render as intended,
- page displays correctly on mobile and desktop,
- key media/assets load successfully.

For release-quality pages, also validate:

- accessibility basics (heading order, contrast, alt text),
- metadata and social preview essentials,
- performance impact of media-heavy sections.

## Ongoing page operations

- Update page content in Page Editor.
- Rebase page structure when template updates are promoted.
- Unpublish/delete/trash through editorial lifecycle workflows when retiring content.

See editor workflows:

- [For Editors Overview](../for-editors/overview.md)
- [Updating and Deleting Articles](../for-editors/updating-and-deleting-articles.md)
- [Scheduling Pages](../for-editors/page-scheduling.md)

## Troubleshooting

Common issues and checks:

- page looks wrong after template change: verify template update path and region ID continuity,
- publish appears stale: clear cache and confirm correct version/state,
- missing media: verify file path/storage availability,
- unexpected layout: confirm assigned/default layout resolution.

## Related guides

- [Layouts](./layouts.md)
- [Templates](./templates.md)
- [For Editors Overview](../for-editors/overview.md)
