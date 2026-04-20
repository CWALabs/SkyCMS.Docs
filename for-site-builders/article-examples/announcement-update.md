<!-- Audience: Site Builders, Designers, Front-End Developers -->
<!-- Type: Example -->

# Announcement and Update Article Examples

This pattern works well for release notes, operational updates, service notices, editorial announcements, or milestone communications that need stronger emphasis on status and timing than a normal content page.

## Recommended editable regions

- `announcement-kicker`
- `announcement-title`
- `announcement-summary`
- `announcement-body`
- `announcement-links`

## No Framework

```html
<article class="announcement-article">
  <header class="announcement-article__header">
    <div data-ccms-ceid="announcement-kicker" data-editor-config="simple" class="ck-content">
      Product Update
    </div>
    <h1 data-ccms-ceid="announcement-title" data-editor-config="title">April Release Now Available</h1>
    <div data-ccms-ceid="announcement-summary" data-editor-config="simple" class="ck-content">
      A concise summary of what changed, why it matters, and what readers should do next.
    </div>
  </header>

  <section data-ccms-ceid="announcement-body" class="ck-content">
    Main update content goes here.
  </section>

  <section data-ccms-ceid="announcement-links" data-editor-config="simple" class="ck-content">
    Related links, follow-up actions, or supporting references go here.
  </section>
</article>
```

## Bootstrap 5

```html
<article class="container py-5">
  <header class="mb-4 rounded-4 border bg-light p-4">
    <div data-ccms-ceid="announcement-kicker" data-editor-config="simple" class="ck-content text-uppercase small fw-semibold text-primary"></div>
    <h1 data-ccms-ceid="announcement-title" data-editor-config="title" class="display-5 mt-2">April Release Now Available</h1>
    <div data-ccms-ceid="announcement-summary" data-editor-config="simple" class="ck-content lead text-body-secondary"></div>
  </header>

  <section data-ccms-ceid="announcement-body" class="ck-content"></section>
  <section data-ccms-ceid="announcement-links" data-editor-config="simple" class="ck-content mt-4"></section>
</article>
```

## Tailwind CSS

```html
<article class="mx-auto max-w-4xl px-6 py-12 lg:px-8">
  <header class="mb-8 rounded-[2rem] border border-slate-200 bg-slate-50 p-6">
    <div data-ccms-ceid="announcement-kicker" data-editor-config="simple" class="ck-content text-sm font-semibold uppercase tracking-[0.2em] text-sky-700"></div>
    <h1 data-ccms-ceid="announcement-title" data-editor-config="title" class="mt-3 text-4xl font-bold tracking-tight text-slate-950">April Release Now Available</h1>
    <div data-ccms-ceid="announcement-summary" data-editor-config="simple" class="ck-content mt-4 text-lg text-slate-600"></div>
  </header>

  <section data-ccms-ceid="announcement-body" class="ck-content prose prose-slate max-w-none"></section>
  <section data-ccms-ceid="announcement-links" data-editor-config="simple" class="ck-content mt-6 rounded-2xl border border-slate-200 p-4"></section>
</article>
```

## Bulma

```html
<article class="section">
  <div class="container" style="max-width: 52rem;">
    <header class="notification is-light mb-5">
      <div data-ccms-ceid="announcement-kicker" data-editor-config="simple" class="ck-content is-size-7 has-text-weight-semibold has-text-link-dark"></div>
      <h1 data-ccms-ceid="announcement-title" data-editor-config="title" class="title is-1 mt-2">April Release Now Available</h1>
      <div data-ccms-ceid="announcement-summary" data-editor-config="simple" class="ck-content subtitle is-5 has-text-grey-dark"></div>
    </header>

    <section data-ccms-ceid="announcement-body" class="ck-content content"></section>
    <section data-ccms-ceid="announcement-links" data-editor-config="simple" class="ck-content mt-5"></section>
  </div>
</article>
```

## Foundation

```html
<article class="grid-container padding-top-3 padding-bottom-3">
  <header class="callout primary margin-bottom-2">
    <div data-ccms-ceid="announcement-kicker" data-editor-config="simple" class="ck-content text-uppercase"></div>
    <h1 data-ccms-ceid="announcement-title" data-editor-config="title" class="margin-top-1">April Release Now Available</h1>
    <div data-ccms-ceid="announcement-summary" data-editor-config="simple" class="ck-content lead"></div>
  </header>

  <section data-ccms-ceid="announcement-body" class="ck-content"></section>
  <section data-ccms-ceid="announcement-links" data-editor-config="simple" class="ck-content callout secondary margin-top-2"></section>
</article>
```

## Notes

- Keep the headline and summary concise.
- Use the links area for next steps, changelogs, or impacted resources.
- If announcements begin to share a repeated visual pattern, promote the structure into a template.

## Related examples

- [Standalone Content Article Examples](./standalone-content.md)
- [Resource Article with Table of Contents Examples](./resource-with-toc.md)
