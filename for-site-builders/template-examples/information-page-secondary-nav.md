---
canonical_title: Information Page with Secondary Navigation Examples
description: Build long-form information templates that separate section navigation from body content while preserving editor-safe region contracts.
doc_type: Tutorial
product_area: site-building
user_intent: implement-information-page-template-with-secondary-navigation
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

# Information Page with Secondary Navigation Examples

## Summary

Information pages with secondary navigation work well for help centers, policy pages, product documentation, service overviews, and other long-form content that benefits from an internal table of contents or section menu.

## Outcome

After completing this guide, you should be able to implement an information template with reliable secondary navigation and clear separation between navigation and body content.

## Recommended editable regions

- `info-page-title`
- `info-page-summary`
- `info-page-secondary-nav`
- `info-page-body`
- `info-page-callout` (optional)

## Template design goals

These templates are designed to:

- keep readers oriented while scrolling through long content,
- separate navigation from the main body,
- support structured editorial updates without changing the page shell,
- work well on desktop while collapsing naturally on smaller screens.

## No Framework

```html
<article class="info-page-template">
  <header class="info-page-template__header">
    <h1 data-ccms-ceid="info-page-title" data-editor-config="title">Policies and Procedures</h1>
    <div data-ccms-ceid="info-page-summary" data-editor-config="simple" class="ck-content">
      A short summary that explains what this page covers and who it is for.
    </div>
  </header>

  <div class="info-page-template__layout">
    <nav aria-label="Section navigation" data-ccms-ceid="info-page-secondary-nav" data-editor-config="simple" class="ck-content">
      <ul>
        <li><a href="#overview">Overview</a></li>
        <li><a href="#requirements">Requirements</a></li>
        <li><a href="#exceptions">Exceptions</a></li>
      </ul>
    </nav>

    <main>
      <section data-ccms-ceid="info-page-body" class="ck-content">
        Main information page content goes here.
      </section>
      <aside data-ccms-ceid="info-page-callout" data-editor-config="simple" class="ck-content">
        Optional callout, contact details, or supporting reference links.
      </aside>
    </main>
  </div>
</article>
```

## Bootstrap 5

```html
<article class="container py-5">
  <header class="mb-4 border-bottom pb-4">
    <h1 data-ccms-ceid="info-page-title" data-editor-config="title" class="display-5">Policies and Procedures</h1>
    <div data-ccms-ceid="info-page-summary" data-editor-config="simple" class="ck-content lead text-body-secondary">
      A short summary that explains what this page covers and who it is for.
    </div>
  </header>

  <div class="row g-4">
    <nav class="col-lg-3" aria-label="Section navigation">
      <div data-ccms-ceid="info-page-secondary-nav" data-editor-config="simple" class="ck-content position-sticky top-0 pt-2 small"></div>
    </nav>
    <main class="col-lg-9">
      <section data-ccms-ceid="info-page-body" class="ck-content"></section>
      <aside data-ccms-ceid="info-page-callout" data-editor-config="simple" class="ck-content mt-4 p-3 bg-light rounded-3"></aside>
    </main>
  </div>
</article>
```

## Tailwind CSS

```html
<article class="mx-auto max-w-7xl px-6 py-12 lg:px-8">
  <header class="mb-8 border-b border-slate-200 pb-6">
    <h1 data-ccms-ceid="info-page-title" data-editor-config="title" class="text-4xl font-bold tracking-tight text-slate-950">Policies and Procedures</h1>
    <div data-ccms-ceid="info-page-summary" data-editor-config="simple" class="ck-content mt-4 max-w-3xl text-lg text-slate-600">
      A short summary that explains what this page covers and who it is for.
    </div>
  </header>

  <div class="grid gap-8 lg:grid-cols-[16rem_minmax(0,1fr)]">
    <nav aria-label="Section navigation" class="lg:sticky lg:top-6 lg:self-start">
      <div data-ccms-ceid="info-page-secondary-nav" data-editor-config="simple" class="ck-content rounded-2xl border border-slate-200 bg-slate-50 p-4"></div>
    </nav>
    <main>
      <section data-ccms-ceid="info-page-body" class="ck-content prose prose-slate max-w-none"></section>
      <aside data-ccms-ceid="info-page-callout" data-editor-config="simple" class="ck-content mt-6 rounded-2xl border border-slate-200 bg-white p-5 shadow-sm"></aside>
    </main>
  </div>
</article>
```

## Bulma

```html
<article class="section">
  <div class="container">
    <header class="mb-5 pb-5" style="border-bottom: 1px solid #e5e7eb;">
      <h1 data-ccms-ceid="info-page-title" data-editor-config="title" class="title is-1">Policies and Procedures</h1>
      <div data-ccms-ceid="info-page-summary" data-editor-config="simple" class="ck-content subtitle is-5 has-text-grey-dark">
        A short summary that explains what this page covers and who it is for.
      </div>
    </header>

    <div class="columns is-variable is-6">
      <nav class="column is-one-quarter" aria-label="Section navigation">
        <div data-ccms-ceid="info-page-secondary-nav" data-editor-config="simple" class="ck-content box"></div>
      </nav>
      <main class="column">
        <section data-ccms-ceid="info-page-body" class="ck-content content"></section>
        <aside data-ccms-ceid="info-page-callout" data-editor-config="simple" class="ck-content notification is-light mt-5"></aside>
      </main>
    </div>
  </div>
</article>
```

## Foundation

```html
<article class="grid-container padding-top-3 padding-bottom-3">
  <header class="margin-bottom-2 padding-bottom-2" style="border-bottom: 1px solid #d1d5db;">
    <h1 data-ccms-ceid="info-page-title" data-editor-config="title">Policies and Procedures</h1>
    <div data-ccms-ceid="info-page-summary" data-editor-config="simple" class="ck-content lead text-secondary">
      A short summary that explains what this page covers and who it is for.
    </div>
  </header>

  <div class="grid-x grid-margin-x">
    <nav class="cell large-3" aria-label="Section navigation">
      <div data-ccms-ceid="info-page-secondary-nav" data-editor-config="simple" class="ck-content callout secondary"></div>
    </nav>
    <main class="cell large-9">
      <section data-ccms-ceid="info-page-body" class="ck-content"></section>
      <aside data-ccms-ceid="info-page-callout" data-editor-config="simple" class="ck-content callout primary margin-top-2"></aside>
    </main>
  </div>
</article>
```

## Notes

- Keep the secondary navigation concise and scannable.
- If the page becomes too long, split it into multiple pages instead of relying on an oversized side menu.
- Use anchor links or section links consistently so the navigation stays trustworthy.
- Treat optional callouts as support content, not the main reading path.

## Related examples

- [Generic Article Template Examples](./generic-article.md)
- [Landing Page Template Examples](./landing-page.md)

## Verification

This example is successful when secondary navigation remains usable across breakpoints, section links are trustworthy, and body/callout regions remain editor-friendly and structurally stable.
