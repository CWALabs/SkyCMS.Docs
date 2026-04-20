<!-- Audience: Site Builders, Designers, Front-End Developers -->
<!-- Type: Example -->

# Tailwind CSS Layout Example

This example shows a SkyCMS layout implemented with Tailwind CSS. It is a good fit for teams that prefer utility-first composition and want tight control over spacing, typography, and responsive behavior.

## Good fit when

- you already use a token-based design system,
- you want to compose layouts directly in markup,
- your team prefers utility classes over prebuilt component abstractions.

## Example structure

```html
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>{{ page.title }}</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <script>
    tailwind.config = {
      theme: {
        extend: {
          colors: {
            brand: {
              50: '#eef6ff',
              600: '#2563eb',
              950: '#172554'
            }
          }
        }
      }
    };
  </script>
</head>
<body class="min-h-screen bg-slate-50 text-slate-900 flex flex-col">
  <header class="border-b border-slate-200 bg-white/95 backdrop-blur">
    <div class="mx-auto flex max-w-7xl items-center justify-between px-6 py-4 lg:px-8">
      <a href="/" class="text-lg font-semibold tracking-tight text-brand-950">SkyCMS Site</a>
      <nav class="hidden gap-8 text-sm font-medium md:flex">
        <a href="/about" class="hover:text-brand-600">About</a>
        <a href="/services" class="hover:text-brand-600">Services</a>
        <a href="/blog" class="hover:text-brand-600">Blog</a>
        <a href="/contact" class="rounded-full bg-brand-600 px-4 py-2 text-white hover:bg-brand-950">Contact</a>
      </nav>
    </div>
  </header>

  <main class="flex-1">
    <section class="mx-auto max-w-7xl px-6 py-12 lg:px-8 lg:py-16">
      <!-- Template/page content renders here -->
      {{ page.content }}
    </section>
  </main>

  <footer class="border-t border-slate-200 bg-white">
    <div class="mx-auto flex max-w-7xl flex-col gap-4 px-6 py-8 text-sm text-slate-600 md:flex-row md:items-center md:justify-between lg:px-8">
      <p>SkyCMS Site. Tailwind-based layout shell.</p>
      <a href="/privacy" class="hover:text-brand-600">Privacy</a>
    </div>
  </footer>
</body>
</html>
```

## Why this works well in SkyCMS

- Tailwind makes it easy to prototype and refine layout structure directly in the layout shell.
- Shared containers, spacing, and typography rules can be standardized without requiring a page-builder-only workflow.
- The layout remains server-rendered and reusable across templates and pages.

## Implementation notes

- In production, prefer a compiled Tailwind build over the CDN script when possible.
- Keep your token definitions centralized so templates and layouts use the same vocabulary.
- Use utility classes for structure, but move repeated patterns into components or documented snippets when they start repeating heavily.

## Best use cases

- product marketing sites,
- editorial sites with custom brand systems,
- teams using design tokens and component libraries,
- projects that value fast iteration without heavy framework JavaScript.

## Related examples

- [Bootstrap 5 Layout Example](./bootstrap-5.md)
- [Bulma Layout Example](./bulma.md)
- [Foundation Layout Example](./foundation.md)
