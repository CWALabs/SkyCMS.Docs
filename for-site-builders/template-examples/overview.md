---
canonical_title: Template Examples
description: Explore SkyCMS template examples across common page types and frameworks while preserving safe editable region contracts.
doc_type: Explanation
product_area: site-building
user_intent: choose-and-adapt-template-examples
audience:
	- Site Builders
	- Designers
	- Front-End Developers
difficulty: intermediate
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# Template Examples

## Summary

This section provides example page templates for common SkyCMS page types using the same framework options featured in the layout examples.

The goal is not to prescribe one exact implementation, but to show how the same content model can be expressed with different framework conventions while preserving clear editable regions and safe template structure.

## Outcome

After completing this guide, you should be able to choose the right page-type template example and adapt it to your selected framework.

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

## Verification

This page is working as intended when you can map a page requirement to one template example and confirm the corresponding editable-region strategy before implementation.
