<!-- Audience: Site Builders, Designers, Front-End Developers -->
<!-- Type: Example -->

# Blog Post Template Examples

Blog post templates should stay close to the structure expected by SkyCMS blog editing and rendering flows. Unlike a generic article, a blog post is not just a free-form page with a body region.

## Blog post structure to preserve

The attached Razor views show that blog posts are typically rendered with:

- a title,
- a publication date,
- optional author information,
- optional category,
- optional introduction,
- optional banner image,
- main content body.

If you deviate too far from that shape, you increase the risk of an inconsistent editing or display experience.

## Built-in blog regions and conventions

If you want these examples to stay close to the built-in SkyCMS blog post flow, keep these identifiers stable:

- `skycms-blog-post-content`: main post body content region.
- `skycms-blog-post-bi`: banner image widget region.
- `skycms-blog-post-author`: optional author information region when the author widget is exposed.

The current blog documentation also references these CSS classes for styling hooks:

- `sky-blog-post-article`
- `sky-blog-post-body`
- `sky-blog-post-info`
- `sky-blog-post-info-updated`
- `sky-blog-post-title`
- `sky-blog-post-content`
- `sky-blog-post-image`

## Metadata vs editable regions

For built-in blog posts, title, date, category, and introduction are typically treated as article metadata that the template renders, not as separate free-form editable regions.

That means the most important editable areas in the template itself are:

- `skycms-blog-post-content`
- `skycms-blog-post-bi`
- `skycms-blog-post-author` (optional)

In the examples below, title, date, category, and introduction are shown as fixed placeholders to represent model-driven blog fields.

## No Framework

```html
<article class="sky-blog-post-article" aria-labelledby="post-title">
  <header class="sky-blog-post-body">
    <p class="sky-blog-post-info">
      <time class="sky-blog-post-info-updated" datetime="2026-01-01T00:00:00Z">January 1, 2026</time>
      <span> · Category</span>
    </p>
    <h1 id="post-title" class="sky-blog-post-title">Blog Post Title</h1>
    <p class="sky-blog-post-introduction">
      Introduction text is typically rendered from blog post metadata.
    </p>
    <div data-ccms-ceid="skycms-blog-post-author" data-editor-config="simple" class="ck-content sky-blog-post-author">
      Optional author info widget region.
    </div>
  </header>

  <figure class="sky-blog-post-image" data-editor-config="image-widget" data-ccms-ceid="skycms-blog-post-bi"></figure>

  <section data-ccms-ceid="skycms-blog-post-content" class="sky-blog-post-content ck-content">
    Main blog post content goes here.
  </section>
</article>
```

## Bootstrap 5

```html
<article class="sky-blog-post-article container py-5" aria-labelledby="post-title">
  <header class="sky-blog-post-body mx-auto mb-4" style="max-width: 52rem;">
    <p class="sky-blog-post-info text-body-secondary">
      <small>
        <time class="sky-blog-post-info-updated" datetime="2026-01-01T00:00:00Z">January 1, 2026</time>
        <span> · Category</span>
      </small>
    </p>
    <h1 id="post-title" class="sky-blog-post-title display-4">Blog Post Title</h1>
    <p class="sky-blog-post-introduction lead">
      Introduction text is typically rendered from blog post metadata.
    </p>
    <div data-ccms-ceid="skycms-blog-post-author" data-editor-config="simple" class="ck-content sky-blog-post-author small text-body-secondary">
      Optional author info widget region.
    </div>
  </header>

  <figure data-editor-config="image-widget" data-ccms-ceid="skycms-blog-post-bi" class="sky-blog-post-image mx-auto mb-5" style="max-width: 52rem;"></figure>

  <section data-ccms-ceid="skycms-blog-post-content" class="sky-blog-post-content ck-content mx-auto" style="max-width: 52rem;">
    Main blog post content goes here.
  </section>
</article>
```

## Tailwind CSS

```html
<article class="sky-blog-post-article mx-auto max-w-4xl px-6 py-12 lg:px-8" aria-labelledby="post-title">
  <header class="sky-blog-post-body mb-8">
    <p class="sky-blog-post-info mt-3 text-sm text-slate-500">
      <time class="sky-blog-post-info-updated" datetime="2026-01-01T00:00:00Z">January 1, 2026</time>
      <span> · Category</span>
    </p>
    <h1 id="post-title" class="sky-blog-post-title text-4xl font-bold tracking-tight text-slate-950">Blog Post Title</h1>
    <p class="sky-blog-post-introduction mt-4 text-lg text-slate-600">
      Introduction text is typically rendered from blog post metadata.
    </p>
    <div data-ccms-ceid="skycms-blog-post-author" data-editor-config="simple" class="ck-content sky-blog-post-author mt-4 text-sm text-slate-500">
      Optional author info widget region.
    </div>
  </header>

  <figure data-editor-config="image-widget" data-ccms-ceid="skycms-blog-post-bi" class="sky-blog-post-image mb-8 overflow-hidden rounded-2xl border border-slate-200"></figure>

  <section data-ccms-ceid="skycms-blog-post-content" class="sky-blog-post-content ck-content prose prose-slate max-w-none">
    Main blog post content goes here.
  </section>
</article>
```

## Bulma

```html
<article class="sky-blog-post-article section" aria-labelledby="post-title">
  <div class="container" style="max-width: 52rem;">
    <header class="sky-blog-post-body mb-5">
      <p class="sky-blog-post-info has-text-grey-dark is-size-7">
        <time class="sky-blog-post-info-updated" datetime="2026-01-01T00:00:00Z">January 1, 2026</time>
        <span> · Category</span>
      </p>
      <h1 id="post-title" class="sky-blog-post-title title is-1">Blog Post Title</h1>
      <p class="sky-blog-post-introduction subtitle is-5 has-text-grey-dark">
        Introduction text is typically rendered from blog post metadata.
      </p>
      <div data-ccms-ceid="skycms-blog-post-author" data-editor-config="simple" class="ck-content sky-blog-post-author is-size-7 has-text-grey-dark">
        Optional author info widget region.
      </div>
    </header>

    <figure data-editor-config="image-widget" data-ccms-ceid="skycms-blog-post-bi" class="sky-blog-post-image mb-5"></figure>

    <section data-ccms-ceid="skycms-blog-post-content" class="sky-blog-post-content ck-content content">
      Main blog post content goes here.
    </section>
  </div>
</article>
```

## Foundation

```html
<article class="sky-blog-post-article grid-container padding-top-3 padding-bottom-3" aria-labelledby="post-title">
  <div class="grid-x align-center">
    <div class="cell large-9">
      <header class="sky-blog-post-body margin-bottom-2">
        <p class="sky-blog-post-info subheader">
          <time class="sky-blog-post-info-updated" datetime="2026-01-01T00:00:00Z">January 1, 2026</time>
          <span> · Category</span>
        </p>
        <h1 id="post-title" class="sky-blog-post-title">Blog Post Title</h1>
        <p class="sky-blog-post-introduction lead">
          Introduction text is typically rendered from blog post metadata.
        </p>
        <div data-ccms-ceid="skycms-blog-post-author" data-editor-config="simple" class="ck-content sky-blog-post-author">
          Optional author info widget region.
        </div>
      </header>

      <figure data-editor-config="image-widget" data-ccms-ceid="skycms-blog-post-bi" class="sky-blog-post-image margin-bottom-2"></figure>

      <section data-ccms-ceid="skycms-blog-post-content" class="sky-blog-post-content ck-content">
        Main blog post content goes here.
      </section>
    </div>
  </div>
</article>
```

## Notes

- Keep the content area prominent and linear.
- Avoid sidebars or promotional blocks that compete with the reading flow unless that is a deliberate editorial choice.
- Preserve strong separation between metadata display and the main article body.
- If you are relying on built-in blog editing and rendering, keep the `skycms-blog-post-*` region IDs intact.
- Treat title, publish date, category, and introduction as metadata display concerns unless you are intentionally replacing the built-in flow.

## Related examples

- [Generic Article Template Examples](./generic-article.md)
- [Landing Page Template Examples](./landing-page.md)
- [Information Page with Secondary Navigation Examples](./information-page-secondary-nav.md)
