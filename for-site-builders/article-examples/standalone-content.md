---
canonical_title: Standalone Content Article Examples
description: Implement one-off article pages with clear editable regions when a reusable template is unnecessary.
doc_type: Tutorial
product_area: site-building
user_intent: build-one-off-article-structure-with-safe-editable-regions
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

# Standalone Content Article Examples

## Summary

This pattern is useful for pages that need clear structure but do not justify a reusable page template, such as a one-off policy page, a founder letter, or a special editorial page.

## Outcome

After completing this guide, you should be able to create a one-off article page with a predictable title, summary, body, and optional callout structure.

## Recommended editable regions

- `standalone-title`
- `standalone-summary`
- `standalone-body`
- `standalone-callout` (optional)

## No Framework

```html
<article class="standalone-article">
  <header class="standalone-article__header">
    <h1 data-ccms-ceid="standalone-title" data-editor-config="title">One-Off Content Page</h1>
    <div data-ccms-ceid="standalone-summary" data-editor-config="simple" class="ck-content">
      A short introduction that frames the page before the main content begins.
    </div>
  </header>

  <section data-ccms-ceid="standalone-body" class="ck-content">
    Main article content goes here.
  </section>

  <aside data-ccms-ceid="standalone-callout" data-editor-config="simple" class="ck-content">
    Optional supporting notes, contact details, or a closing CTA.
  </aside>
</article>
```

## Bootstrap 5

```html
<article class="container py-5">
  <header class="mb-4 border-bottom pb-4">
    <h1 data-ccms-ceid="standalone-title" data-editor-config="title" class="display-5">One-Off Content Page</h1>
    <div data-ccms-ceid="standalone-summary" data-editor-config="simple" class="ck-content lead text-body-secondary">
      A short introduction that frames the page before the main content begins.
    </div>
  </header>

  <section data-ccms-ceid="standalone-body" class="ck-content"></section>

  <aside data-ccms-ceid="standalone-callout" data-editor-config="simple" class="ck-content mt-4 rounded-3 bg-light p-3"></aside>
</article>
```

## Tailwind CSS

```html
<article class="mx-auto max-w-4xl px-6 py-12 lg:px-8">
  <header class="mb-8 border-b border-slate-200 pb-6">
    <h1 data-ccms-ceid="standalone-title" data-editor-config="title" class="text-4xl font-bold tracking-tight text-slate-950">One-Off Content Page</h1>
    <div data-ccms-ceid="standalone-summary" data-editor-config="simple" class="ck-content mt-4 text-lg text-slate-600">
      A short introduction that frames the page before the main content begins.
    </div>
  </header>

  <section data-ccms-ceid="standalone-body" class="ck-content prose prose-slate max-w-none"></section>

  <aside data-ccms-ceid="standalone-callout" data-editor-config="simple" class="ck-content mt-6 rounded-2xl border border-slate-200 bg-slate-50 p-5"></aside>
</article>
```

## Bulma

```html
<article class="section">
  <div class="container" style="max-width: 52rem;">
    <header class="mb-5 pb-5" style="border-bottom: 1px solid #e5e7eb;">
      <h1 data-ccms-ceid="standalone-title" data-editor-config="title" class="title is-1">One-Off Content Page</h1>
      <div data-ccms-ceid="standalone-summary" data-editor-config="simple" class="ck-content subtitle is-5 has-text-grey-dark">
        A short introduction that frames the page before the main content begins.
      </div>
    </header>

    <section data-ccms-ceid="standalone-body" class="ck-content content"></section>

    <aside data-ccms-ceid="standalone-callout" data-editor-config="simple" class="ck-content box mt-5"></aside>
  </div>
</article>
```

## Foundation

```html
<article class="grid-container padding-top-3 padding-bottom-3">
  <header class="margin-bottom-2 padding-bottom-2" style="border-bottom: 1px solid #d1d5db;">
    <h1 data-ccms-ceid="standalone-title" data-editor-config="title">One-Off Content Page</h1>
    <div data-ccms-ceid="standalone-summary" data-editor-config="simple" class="ck-content lead text-secondary">
      A short introduction that frames the page before the main content begins.
    </div>
  </header>

  <section data-ccms-ceid="standalone-body" class="ck-content"></section>

  <aside data-ccms-ceid="standalone-callout" data-editor-config="simple" class="ck-content callout secondary margin-top-2"></aside>
</article>
```

## Notes

- Keep this pattern for true one-off content only.
- If the same structure appears repeatedly, convert it into a template.
- Use the callout area for support content rather than the main reading flow.

## Widget-backed variant using the image widget

If the one-off page needs an editor-managed hero or supporting image, you can use the built-in image widget directly in the article.

```html
<article class="standalone-article">
  <header class="standalone-article__header">
    <h1 data-ccms-ceid="standalone-title" data-editor-config="title">One-Off Content Page</h1>
    <div data-ccms-ceid="standalone-summary" data-editor-config="simple" class="ck-content">
      A short introduction that frames the page before the main content begins.
    </div>
  </header>

  <div class="ccms-img-widget-container"
       data-editor-config="image-widget"
       data-ccms-ceid="standalone-feature-image"
       data-ccms-enable-alt-editor="true"></div>

  <section data-ccms-ceid="standalone-body" class="ck-content">
    Main article content goes here.
  </section>
</article>
```

Use this when the page needs a managed image, but do not add an image widget just because a pattern feels visually empty.

## Related examples

- [Announcement and Update Article Examples](./announcement-update.md)
- [Resource Article with Table of Contents Examples](./resource-with-toc.md)
- [Event Page Article Examples](./event-page.md)

## Verification

This example is successful when content regions render in the intended order, optional callouts remain non-blocking, and the page structure can be maintained without converting to a reusable template.
