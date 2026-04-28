---
canonical_title: Generic Article Template Examples
description: Build flexible article templates for long-form content while keeping stable editable-region contracts across frameworks.
doc_type: Tutorial
product_area: site-building
user_intent: implement-generic-article-template-pattern
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

# Generic Article Template Examples

## Summary

Generic article templates are the safest starting point for documentation pages, policy pages, knowledge-base content, and long-form editorial content.

## Outcome

After completing this guide, you should be able to implement a reusable generic article template with consistent title, summary, body, and optional sidebar regions.

## Recommended editable regions

- `article-title`
- `article-summary`
- `article-body`
- `article-sidebar` (optional)

## No Framework

```html
<article class="article-template">
  <header class="article-template__header">
    <h1 data-ccms-ceid="article-title" data-editor-config="title">Article Title</h1>
    <div data-ccms-ceid="article-summary" data-editor-config="simple" class="ck-content">
      A short summary or standfirst for the article.
    </div>
  </header>

  <div class="article-template__layout">
    <main>
      <section data-ccms-ceid="article-body" class="ck-content">
        Main article content goes here.
      </section>
    </main>
    <aside data-ccms-ceid="article-sidebar" data-editor-config="simple" class="ck-content">
      Optional supporting notes, callouts, or related links.
    </aside>
  </div>
</article>
```

## Bootstrap 5

```html
<article class="container py-5">
  <header class="mb-4 border-bottom pb-4">
    <h1 data-ccms-ceid="article-title" data-editor-config="title" class="display-5">Article Title</h1>
    <div data-ccms-ceid="article-summary" data-editor-config="simple" class="ck-content lead text-body-secondary">
      A short summary or standfirst for the article.
    </div>
  </header>

  <div class="row g-4">
    <main class="col-lg-8">
      <section data-ccms-ceid="article-body" class="ck-content">
        Main article content goes here.
      </section>
    </main>
    <aside class="col-lg-4">
      <div data-ccms-ceid="article-sidebar" data-editor-config="simple" class="ck-content p-3 bg-light rounded-3">
        Optional supporting notes, callouts, or related links.
      </div>
    </aside>
  </div>
</article>
```

## Tailwind CSS

```html
<article class="mx-auto max-w-6xl px-6 py-12 lg:px-8">
  <header class="mb-8 border-b border-slate-200 pb-6">
    <h1 data-ccms-ceid="article-title" data-editor-config="title" class="text-4xl font-bold tracking-tight text-slate-950">Article Title</h1>
    <div data-ccms-ceid="article-summary" data-editor-config="simple" class="ck-content mt-4 max-w-3xl text-lg text-slate-600">
      A short summary or standfirst for the article.
    </div>
  </header>

  <div class="grid gap-8 lg:grid-cols-[minmax(0,1fr)_20rem]">
    <main>
      <section data-ccms-ceid="article-body" class="ck-content prose prose-slate max-w-none">
        Main article content goes here.
      </section>
    </main>
    <aside>
      <div data-ccms-ceid="article-sidebar" data-editor-config="simple" class="ck-content rounded-2xl border border-slate-200 bg-slate-50 p-5">
        Optional supporting notes, callouts, or related links.
      </div>
    </aside>
  </div>
</article>
```

## Bulma

```html
<article class="section">
  <div class="container">
    <header class="mb-5 pb-5" style="border-bottom: 1px solid #e5e7eb;">
      <h1 data-ccms-ceid="article-title" data-editor-config="title" class="title is-1">Article Title</h1>
      <div data-ccms-ceid="article-summary" data-editor-config="simple" class="ck-content subtitle is-5 has-text-grey-dark">
        A short summary or standfirst for the article.
      </div>
    </header>

    <div class="columns is-variable is-6">
      <main class="column is-two-thirds">
        <section data-ccms-ceid="article-body" class="ck-content content">
          Main article content goes here.
        </section>
      </main>
      <aside class="column">
        <div data-ccms-ceid="article-sidebar" data-editor-config="simple" class="ck-content box">
          Optional supporting notes, callouts, or related links.
        </div>
      </aside>
    </div>
  </div>
</article>
```

## Foundation

```html
<article class="grid-container padding-top-3 padding-bottom-3">
  <header class="margin-bottom-2 padding-bottom-2" style="border-bottom: 1px solid #d1d5db;">
    <h1 data-ccms-ceid="article-title" data-editor-config="title">Article Title</h1>
    <div data-ccms-ceid="article-summary" data-editor-config="simple" class="ck-content lead text-secondary">
      A short summary or standfirst for the article.
    </div>
  </header>

  <div class="grid-x grid-margin-x">
    <main class="cell large-8">
      <section data-ccms-ceid="article-body" class="ck-content">
        Main article content goes here.
      </section>
    </main>
    <aside class="cell large-4">
      <div data-ccms-ceid="article-sidebar" data-editor-config="simple" class="ck-content callout secondary">
        Optional supporting notes, callouts, or related links.
      </div>
    </aside>
  </div>
</article>
```

## Notes

- Keep the article body region stable across template versions.
- Sidebars should remain optional and should not contain critical article content.
- Use summary regions for short editorial text, not the full article body.

## Related examples

- [Blog Post Template Examples](./blog-post.md)
- [Landing Page Template Examples](./landing-page.md)
- [Information Page with Secondary Navigation Examples](./information-page-secondary-nav.md)

## Verification

This example is successful when editable regions render in the expected hierarchy, the body region remains stable across template revisions, and optional sidebar content does not block core reading flow.
