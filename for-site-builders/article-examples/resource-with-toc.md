---
canonical_title: Resource Article with Table of Contents Examples
description: Build long-form resource articles with internal navigation and optional reference callouts using manual or widget-backed ToC approaches.
doc_type: Tutorial
product_area: site-building
user_intent: implement-resource-article-with-internal-navigation
audience:
  - Site Builders
  - Designers
  - Front-End Developers
difficulty: advanced
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# Resource Article with Table of Contents Examples

## Summary

This pattern is useful for long-form guides, help articles, onboarding documents, and process documentation that benefit from internal navigation.

## Outcome

After completing this guide, you should be able to implement a resource article with reliable in-page navigation and optional reference/support content regions.

## Recommended editable regions

- `resource-title`
- `resource-summary`
- `resource-toc`
- `resource-body`
- `resource-reference-box` (optional)

## No Framework

```html
<article class="resource-article">
  <header class="resource-article__header">
    <h1 data-ccms-ceid="resource-title" data-editor-config="title">Implementation Guide</h1>
    <div data-ccms-ceid="resource-summary" data-editor-config="simple" class="ck-content">
      A short introduction that explains the scope of the guide and who should use it.
    </div>
  </header>

  <div class="resource-article__layout">
    <nav aria-label="Table of contents" data-ccms-ceid="resource-toc" data-editor-config="simple" class="ck-content">
      <ul>
        <li><a href="#overview">Overview</a></li>
        <li><a href="#setup">Setup</a></li>
        <li><a href="#validation">Validation</a></li>
      </ul>
    </nav>

    <main>
      <section data-ccms-ceid="resource-body" class="ck-content">
        Main guide content goes here.
      </section>
      <aside data-ccms-ceid="resource-reference-box" data-editor-config="simple" class="ck-content">
        Optional checklist, support links, or reference notes.
      </aside>
    </main>
  </div>
</article>
```

## Bootstrap 5

```html
<article class="container py-5">
  <header class="mb-4 border-bottom pb-4">
    <h1 data-ccms-ceid="resource-title" data-editor-config="title" class="display-5">Implementation Guide</h1>
    <div data-ccms-ceid="resource-summary" data-editor-config="simple" class="ck-content lead text-body-secondary"></div>
  </header>

  <div class="row g-4">
    <nav class="col-lg-3" aria-label="Table of contents">
      <div data-ccms-ceid="resource-toc" data-editor-config="simple" class="ck-content position-sticky top-0 pt-2 small"></div>
    </nav>
    <main class="col-lg-9">
      <section data-ccms-ceid="resource-body" class="ck-content"></section>
      <aside data-ccms-ceid="resource-reference-box" data-editor-config="simple" class="ck-content mt-4 rounded-3 bg-light p-3"></aside>
    </main>
  </div>
</article>
```

## Tailwind CSS

```html
<article class="mx-auto max-w-7xl px-6 py-12 lg:px-8">
  <header class="mb-8 border-b border-slate-200 pb-6">
    <h1 data-ccms-ceid="resource-title" data-editor-config="title" class="text-4xl font-bold tracking-tight text-slate-950">Implementation Guide</h1>
    <div data-ccms-ceid="resource-summary" data-editor-config="simple" class="ck-content mt-4 max-w-3xl text-lg text-slate-600"></div>
  </header>

  <div class="grid gap-8 lg:grid-cols-[16rem_minmax(0,1fr)]">
    <nav aria-label="Table of contents" class="lg:sticky lg:top-6 lg:self-start">
      <div data-ccms-ceid="resource-toc" data-editor-config="simple" class="ck-content rounded-2xl border border-slate-200 bg-slate-50 p-4"></div>
    </nav>
    <main>
      <section data-ccms-ceid="resource-body" class="ck-content prose prose-slate max-w-none"></section>
      <aside data-ccms-ceid="resource-reference-box" data-editor-config="simple" class="ck-content mt-6 rounded-2xl border border-slate-200 bg-white p-5 shadow-sm"></aside>
    </main>
  </div>
</article>
```

## Bulma

```html
<article class="section">
  <div class="container">
    <header class="mb-5 pb-5" style="border-bottom: 1px solid #e5e7eb;">
      <h1 data-ccms-ceid="resource-title" data-editor-config="title" class="title is-1">Implementation Guide</h1>
      <div data-ccms-ceid="resource-summary" data-editor-config="simple" class="ck-content subtitle is-5 has-text-grey-dark"></div>
    </header>

    <div class="columns is-variable is-6">
      <nav class="column is-one-quarter" aria-label="Table of contents">
        <div data-ccms-ceid="resource-toc" data-editor-config="simple" class="ck-content box"></div>
      </nav>
      <main class="column">
        <section data-ccms-ceid="resource-body" class="ck-content content"></section>
        <aside data-ccms-ceid="resource-reference-box" data-editor-config="simple" class="ck-content notification is-light mt-5"></aside>
      </main>
    </div>
  </div>
</article>
```

## Foundation

```html
<article class="grid-container padding-top-3 padding-bottom-3">
  <header class="margin-bottom-2 padding-bottom-2" style="border-bottom: 1px solid #d1d5db;">
    <h1 data-ccms-ceid="resource-title" data-editor-config="title">Implementation Guide</h1>
    <div data-ccms-ceid="resource-summary" data-editor-config="simple" class="ck-content lead text-secondary"></div>
  </header>

  <div class="grid-x grid-margin-x">
    <nav class="cell large-3" aria-label="Table of contents">
      <div data-ccms-ceid="resource-toc" data-editor-config="simple" class="ck-content callout secondary"></div>
    </nav>
    <main class="cell large-9">
      <section data-ccms-ceid="resource-body" class="ck-content"></section>
      <aside data-ccms-ceid="resource-reference-box" data-editor-config="simple" class="ck-content callout primary margin-top-2"></aside>
    </main>
  </div>
</article>
```

## Notes

- Keep the table of contents short and useful.
- Match anchor links and headings carefully so navigation remains accurate.
- If this pattern becomes common across many pages, it should usually become a page template instead of staying article-only.

## Widget-backed variant using the ToC widget

If the page lives within a section hierarchy, you can use the built-in ToC helper instead of hand-authoring the navigation list.

```html
<meta name="cwps-meta-path-url" content="docs/getting-started" />

<article class="resource-article">
  <header class="resource-article__header">
    <h1 data-ccms-ceid="resource-title" data-editor-config="title">Implementation Guide</h1>
    <div data-ccms-ceid="resource-summary" data-editor-config="simple" class="ck-content">
      A short introduction that explains the scope of the guide and who should use it.
    </div>
  </header>

  <div class="resource-article__layout">
    <nav aria-label="Table of contents">
      <ul id="resourceToc" class="toc-list"></ul>
    </nav>

    <main>
      <section data-ccms-ceid="resource-body" class="ck-content">
        Main guide content goes here.
      </section>
    </main>
  </div>

  <script src="/lib/cosmos/toc.js"></script>
  <script>
    cosmos_cms_build_toc_default('resourceToc', 'toc-link', 'is-active');
  </script>
</article>
```

Use this approach when the article should reflect the actual published page tree rather than a manually curated list of links.

## Related examples

- [Standalone Content Article Examples](./standalone-content.md)
- [Announcement and Update Article Examples](./announcement-update.md)
- [Event Page Article Examples](./event-page.md)

## Verification

This example is successful when table-of-contents navigation maps accurately to article sections, body content remains readable, and reference callouts stay secondary to the main reading path.
