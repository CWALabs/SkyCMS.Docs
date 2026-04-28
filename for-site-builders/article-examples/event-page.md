---
canonical_title: Event Page Article Examples
description: Build one-off event pages with structured schedule details, registration guidance, and optional hero imagery.
doc_type: Tutorial
product_area: site-building
user_intent: implement-one-off-event-article-page
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

# Event Page Article Examples

## Summary

This pattern is useful for one-off webinars, launch events, training sessions, meetups, or registration pages that need schedule and location details but do not justify a reusable template.

## Outcome

After completing this guide, you should be able to implement an event page with clear details, body content, and registration next-step regions.

## Recommended editable regions

- `event-kicker`
- `event-title`
- `event-summary`
- `event-details`
- `event-body`
- `event-registration`

## No Framework

```html
<article class="event-article">
  <header class="event-article__header">
    <div data-ccms-ceid="event-kicker" data-editor-config="simple" class="ck-content">
      Live Event
    </div>
    <h1 data-ccms-ceid="event-title" data-editor-config="title">Spring Product Workshop</h1>
    <div data-ccms-ceid="event-summary" data-editor-config="simple" class="ck-content">
      A short introduction that explains who the event is for and why it matters.
    </div>
  </header>

  <section data-ccms-ceid="event-details" data-editor-config="simple" class="ck-content">
    <p><strong>Date:</strong> May 14, 2026</p>
    <p><strong>Location:</strong> Online</p>
  </section>

  <section data-ccms-ceid="event-body" class="ck-content">
    Main event information goes here.
  </section>

  <section data-ccms-ceid="event-registration" data-editor-config="simple" class="ck-content">
    Registration details or next steps go here.
  </section>
</article>
```

## Bootstrap 5

```html
<article class="container py-5">
  <header class="mb-4 rounded-4 border bg-light p-4">
    <div data-ccms-ceid="event-kicker" data-editor-config="simple" class="ck-content text-uppercase small fw-semibold text-primary"></div>
    <h1 data-ccms-ceid="event-title" data-editor-config="title" class="display-5 mt-2">Spring Product Workshop</h1>
    <div data-ccms-ceid="event-summary" data-editor-config="simple" class="ck-content lead text-body-secondary"></div>
  </header>

  <section data-ccms-ceid="event-details" data-editor-config="simple" class="ck-content mb-4 rounded-3 border p-3"></section>
  <section data-ccms-ceid="event-body" class="ck-content"></section>
  <section data-ccms-ceid="event-registration" data-editor-config="simple" class="ck-content mt-4 rounded-3 bg-light p-3"></section>
</article>
```

## Tailwind CSS

```html
<article class="mx-auto max-w-4xl px-6 py-12 lg:px-8">
  <header class="mb-8 rounded-[2rem] border border-slate-200 bg-slate-50 p-6">
    <div data-ccms-ceid="event-kicker" data-editor-config="simple" class="ck-content text-sm font-semibold uppercase tracking-[0.2em] text-sky-700"></div>
    <h1 data-ccms-ceid="event-title" data-editor-config="title" class="mt-3 text-4xl font-bold tracking-tight text-slate-950">Spring Product Workshop</h1>
    <div data-ccms-ceid="event-summary" data-editor-config="simple" class="ck-content mt-4 text-lg text-slate-600"></div>
  </header>

  <section data-ccms-ceid="event-details" data-editor-config="simple" class="ck-content mb-6 rounded-2xl border border-slate-200 bg-white p-4 shadow-sm"></section>
  <section data-ccms-ceid="event-body" class="ck-content prose prose-slate max-w-none"></section>
  <section data-ccms-ceid="event-registration" data-editor-config="simple" class="ck-content mt-6 rounded-2xl border border-slate-200 bg-slate-50 p-5"></section>
</article>
```

## Bulma

```html
<article class="section">
  <div class="container" style="max-width: 52rem;">
    <header class="notification is-light mb-5">
      <div data-ccms-ceid="event-kicker" data-editor-config="simple" class="ck-content is-size-7 has-text-weight-semibold has-text-link-dark"></div>
      <h1 data-ccms-ceid="event-title" data-editor-config="title" class="title is-1 mt-2">Spring Product Workshop</h1>
      <div data-ccms-ceid="event-summary" data-editor-config="simple" class="ck-content subtitle is-5 has-text-grey-dark"></div>
    </header>

    <section data-ccms-ceid="event-details" data-editor-config="simple" class="ck-content box mb-5"></section>
    <section data-ccms-ceid="event-body" class="ck-content content"></section>
    <section data-ccms-ceid="event-registration" data-editor-config="simple" class="ck-content notification is-light mt-5"></section>
  </div>
</article>
```

## Foundation

```html
<article class="grid-container padding-top-3 padding-bottom-3">
  <header class="callout primary margin-bottom-2">
    <div data-ccms-ceid="event-kicker" data-editor-config="simple" class="ck-content text-uppercase"></div>
    <h1 data-ccms-ceid="event-title" data-editor-config="title" class="margin-top-1">Spring Product Workshop</h1>
    <div data-ccms-ceid="event-summary" data-editor-config="simple" class="ck-content lead"></div>
  </header>

  <section data-ccms-ceid="event-details" data-editor-config="simple" class="ck-content callout secondary margin-bottom-2"></section>
  <section data-ccms-ceid="event-body" class="ck-content"></section>
  <section data-ccms-ceid="event-registration" data-editor-config="simple" class="ck-content callout primary margin-top-2"></section>
</article>
```

## Widget-backed variant using the image widget

If the event page needs a managed hero image, speaker photo, or venue image, use the image widget directly in the article.

```html
<article class="event-article">
  <header class="event-article__header">
    <h1 data-ccms-ceid="event-title" data-editor-config="title">Spring Product Workshop</h1>
    <div data-ccms-ceid="event-summary" data-editor-config="simple" class="ck-content">
      A short introduction that explains who the event is for and why it matters.
    </div>
  </header>

  <div class="ccms-img-widget-container"
       data-editor-config="image-widget"
       data-ccms-ceid="event-hero-image"
       data-ccms-enable-alt-editor="true"></div>

  <section data-ccms-ceid="event-details" data-editor-config="simple" class="ck-content"></section>
  <section data-ccms-ceid="event-body" class="ck-content"></section>
</article>
```

## Notes

- Keep date, time, and location details easy to scan.
- Use this pattern for one-off events, not a recurring event program with shared structure.
- If the site publishes many event pages, move the format into a reusable template.

## Related examples

- [Announcement and Update Article Examples](./announcement-update.md)
- [Resource Article with Table of Contents Examples](./resource-with-toc.md)

## Verification

This example is successful when event details are easy to scan, registration guidance is explicit, and optional media integrations support the page without disrupting essential event information.
