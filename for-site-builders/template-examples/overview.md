<!-- Audience: Site Builders, Designers, Front-End Developers -->
<!-- Type: Reference + Example -->

# Template Examples

This section provides example page templates for common SkyCMS page types using the same framework options featured in the layout examples.

The goal is not to prescribe one exact implementation, but to show how the same content model can be expressed with different framework conventions while preserving clear editable regions and safe template structure.

## Included page types

- [Generic Article](./generic-article.md): a flexible long-form content template for documentation, guides, and information pages.
- [Blog Post](./blog-post.md): a stricter content template aligned with SkyCMS blog rendering expectations.
- [Landing Page](./landing-page.md): a marketing-oriented template with a hero, benefit sections, and a clear call to action.
- [Information Page with Secondary Navigation](./information-page-secondary-nav.md): a structured content template for policies, service areas, help hubs, and documentation sections that need in-page or section-level navigation.

## Frameworks used in these examples

Each page type includes examples for:

- No Framework
- Bootstrap 5
- Tailwind CSS
- Bulma
- Foundation

## Why these examples matter

Templates in SkyCMS are more sensitive than layouts because they define the editable content contract. That means good template examples should show:

- clear editable region boundaries,
- stable `data-ccms-ceid` values,
- semantic content structure,
- framework-specific classes without unnecessary nesting,
- safe separation between template structure and layout responsibilities.

The set also covers a broader range of page behavior:

- flexible editorial content,
- blog-specific content with fixed metadata conventions,
- conversion-focused campaign structure,
- long-form information architecture with secondary navigation.

## Special note about blog posts

Blog posts are less free-form than generic article templates. The editor and public rendering paths expect a recognizable structure built around:

- title,
- published date,
- optional author metadata,
- optional category,
- optional introduction,
- optional banner image,
- primary content body.

For that reason, the blog post examples are intentionally more constrained than the article or landing page examples.

## Special note about information pages

Information pages with secondary navigation are useful when a single page contains multiple sections and readers need a reliable way to move between them. In these examples, the secondary navigation is treated as part of the template structure, while the linked content sections remain editable.

## Related guides

- [Templates](../templates.md)
- [Layouts](../layouts.md)
- [Layout Examples Overview](../layout-examples/overview.md)
- [Blogging](../../for-editors/blogging.md)
- [Blog Architecture](../../for-developers/blog-architecture.md)
