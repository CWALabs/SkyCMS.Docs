<!-- Audience: Site Builders, Designers, Front-End Developers -->
<!-- Type: Example -->

# Landing Page Template Examples

Landing page templates are useful for campaigns, product launches, lead generation pages, and focused marketing pages with a clear message hierarchy.

## Recommended editable regions

- `landing-hero-title`
- `landing-hero-copy`
- `landing-primary-cta`
- `landing-feature-blocks`
- `landing-proof`
- `landing-secondary-cta`

## No Framework

```html
<section class="landing-template">
  <header class="landing-template__hero">
    <h1 data-ccms-ceid="landing-hero-title" data-editor-config="title">Launch a better site with SkyCMS</h1>
    <div data-ccms-ceid="landing-hero-copy" data-editor-config="simple" class="ck-content">
      A concise pitch that explains the offer and who it is for.
    </div>
    <div data-ccms-ceid="landing-primary-cta" data-editor-config="simple" class="ck-content">
      <p><a href="/contact">Start your project</a></p>
    </div>
  </header>

  <section data-ccms-ceid="landing-feature-blocks" class="ck-content">
    Feature blocks or value propositions go here.
  </section>

  <section data-ccms-ceid="landing-proof" data-editor-config="simple" class="ck-content">
    Testimonials, logos, or trust indicators go here.
  </section>

  <section data-ccms-ceid="landing-secondary-cta" data-editor-config="simple" class="ck-content">
    A closing call to action goes here.
  </section>
</section>
```

## Bootstrap 5

```html
<section class="container py-5">
  <header class="text-center py-5 border rounded-4 bg-light mb-5">
    <h1 data-ccms-ceid="landing-hero-title" data-editor-config="title" class="display-3">Launch a better site with SkyCMS</h1>
    <div data-ccms-ceid="landing-hero-copy" data-editor-config="simple" class="ck-content lead mx-auto" style="max-width: 42rem;">
      A concise pitch that explains the offer and who it is for.
    </div>
    <div data-ccms-ceid="landing-primary-cta" data-editor-config="simple" class="ck-content mt-4"></div>
  </header>

  <section data-ccms-ceid="landing-feature-blocks" class="ck-content mb-5"></section>
  <section data-ccms-ceid="landing-proof" data-editor-config="simple" class="ck-content mb-5"></section>
  <section data-ccms-ceid="landing-secondary-cta" data-editor-config="simple" class="ck-content text-center"></section>
</section>
```

## Tailwind CSS

```html
<section class="mx-auto max-w-7xl px-6 py-12 lg:px-8">
  <header class="mb-12 rounded-[2rem] border border-slate-200 bg-slate-50 px-8 py-16 text-center shadow-sm">
    <h1 data-ccms-ceid="landing-hero-title" data-editor-config="title" class="text-5xl font-bold tracking-tight text-slate-950">Launch a better site with SkyCMS</h1>
    <div data-ccms-ceid="landing-hero-copy" data-editor-config="simple" class="ck-content mx-auto mt-6 max-w-3xl text-lg text-slate-600">
      A concise pitch that explains the offer and who it is for.
    </div>
    <div data-ccms-ceid="landing-primary-cta" data-editor-config="simple" class="ck-content mt-8"></div>
  </header>

  <section data-ccms-ceid="landing-feature-blocks" class="ck-content mb-10"></section>
  <section data-ccms-ceid="landing-proof" data-editor-config="simple" class="ck-content mb-10"></section>
  <section data-ccms-ceid="landing-secondary-cta" data-editor-config="simple" class="ck-content text-center"></section>
</section>
```

## Bulma

```html
<section class="section">
  <div class="container">
    <header class="hero is-light mb-6">
      <div class="hero-body has-text-centered">
        <h1 data-ccms-ceid="landing-hero-title" data-editor-config="title" class="title is-1">Launch a better site with SkyCMS</h1>
        <div data-ccms-ceid="landing-hero-copy" data-editor-config="simple" class="ck-content subtitle is-4 mx-auto" style="max-width: 42rem;">
          A concise pitch that explains the offer and who it is for.
        </div>
        <div data-ccms-ceid="landing-primary-cta" data-editor-config="simple" class="ck-content mt-4"></div>
      </div>
    </header>

    <section data-ccms-ceid="landing-feature-blocks" class="ck-content mb-6"></section>
    <section data-ccms-ceid="landing-proof" data-editor-config="simple" class="ck-content mb-6"></section>
    <section data-ccms-ceid="landing-secondary-cta" data-editor-config="simple" class="ck-content has-text-centered"></section>
  </div>
</section>
```

## Foundation

```html
<section class="grid-container padding-top-3 padding-bottom-3">
  <header class="callout primary text-center padding-top-3 padding-bottom-3 margin-bottom-3">
    <h1 data-ccms-ceid="landing-hero-title" data-editor-config="title">Launch a better site with SkyCMS</h1>
    <div data-ccms-ceid="landing-hero-copy" data-editor-config="simple" class="ck-content lead float-center" style="max-width: 42rem;">
      A concise pitch that explains the offer and who it is for.
    </div>
    <div data-ccms-ceid="landing-primary-cta" data-editor-config="simple" class="ck-content margin-top-2"></div>
  </header>

  <section data-ccms-ceid="landing-feature-blocks" class="ck-content margin-bottom-3"></section>
  <section data-ccms-ceid="landing-proof" data-editor-config="simple" class="ck-content margin-bottom-3"></section>
  <section data-ccms-ceid="landing-secondary-cta" data-editor-config="simple" class="ck-content text-center"></section>
</section>
```

## Notes

- Keep landing templates focused. Avoid too many competing editable zones.
- CTA regions should stay intentionally scoped so editors do not turn the page into an unstructured content dump.
- Proof and feature sections should be flexible, but still support a clear reading sequence.

## Related examples

- [Generic Article Template Examples](./generic-article.md)
- [Blog Post Template Examples](./blog-post.md)
- [Information Page with Secondary Navigation Examples](./information-page-secondary-nav.md)
