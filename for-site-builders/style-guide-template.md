---
canonical_title: Style Guide Template
description: Use this template to define brand standards for typography, color, imagery, UI components, and accessibility.
doc_type: Reference
product_area: site-building
user_intent: create-or-refresh-a-website-style-guide
audience:
  - Designers
  - Site Builders
  - Brand Managers
difficulty: intermediate
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# Style Guide Template

## Summary

Copy and customize this template when you need to create or consolidate website brand standards across content, design, and UI implementation.

## Outcome

After completing this template, your team should have a shared style-guide source of truth for brand identity, visual system decisions, and component-level consistency.

## When To Use This Page

Use this template for:

- New brand launches.
- Rebranding projects.
- Consolidating fragmented visual standards.
- Aligning content, design, and front-end implementation.

## Verification

This template is complete when:

- Key brand decisions are documented.
- Example values are replaced with organization-specific values.
- Teams can execute design and content work without undocumented assumptions.

## Document Information

Fill in and keep current:

- Organization: [Your Organization Name]
- Website: [Your Website URL]
- Last Updated: [Date]
- Version: 1.0
- Owner: [Brand/Marketing Team]
- Approved By: [Manager/Executive]

## 1. Brand Overview

### Brand Mission

Describe what your organization does and why.

Example:

At [Company], we help [target audience] [achieve goal] by [what makes you unique].

Your mission:

[Fill in your brand mission here]

### Brand Values

List the values that define your brand.

Example values:

- Innovation
- Transparency
- Customer-focused
- Sustainability

Your brand values:

1. [Value 1]: [Brief description]
2. [Value 2]: [Brief description]
3. [Value 3]: [Brief description]
4. [Value 4]: [Brief description]

### Brand Personality

Describe your brand as if it were a person.

Example:

Professional yet approachable, innovative but trusted, modern and forward-thinking.

Your brand personality:

[Describe your brand personality]

## 2. Logo And Visual Identity

### Logo

Include logo images or links to logo files.

Logo file locations:

- Full color: [file path/link]
- Black and white: [file path/link]
- Icon version: [file path/link]
- Favicon: [file path/link]

### Logo Usage Guidelines

Do:

- Use official logo files.
- Maintain clear space around the logo (minimum [X] pixels).
- Use on contrasting backgrounds.
- Maintain aspect ratio when resizing.

Do not:

- Rotate or skew the logo.
- Change logo colors.
- Add effects (shadows, gradients, outlines).
- Use low-resolution versions.
- Combine logo with unrelated graphics.

### Clear Space

The minimum clear space around the logo should equal the height of the "X" in the logo (or [X] pixels).

### Logo Sizing

- Minimum size: [X] pixels wide.
- Preferred sizes: [sizes for different applications].
- File formats: PNG (recommended), SVG, EPS, PDF.

## 3. Color Palette

### Primary Colors

Use primary colors for major UI elements and primary calls to action.

- Primary blue: #[CODE] (RGB R:[X] G:[X] B:[X], CMYK C:[X] M:[X] Y:[X] K:[X])
- Primary orange: #[CODE] (RGB R:[X] G:[X] B:[X], CMYK C:[X] M:[X] Y:[X] K:[X])
- Neutral gray: #[CODE] (RGB R:[X] G:[X] B:[X], CMYK C:[X] M:[X] Y:[X] K:[X])

Example primary palette:

```html
<div style="background-color: #0066CC; color: white; padding: 20px;">Primary Blue #0066CC</div>
<div style="background-color: #FF6600; color: white; padding: 20px;">Primary Orange #FF6600</div>
<div style="background-color: #333333; color: white; padding: 20px;">Neutral Gray #333333</div>
```

### Secondary Colors

Use secondary colors for accents and supporting UI.

- Light blue: #[CODE] (background fills, light accents)
- Dark gray: #[CODE] (dark text, borders)
- Accent green: #[CODE] (success states, confirmations)

### Functional Colors

Use functional colors consistently:

- Success: green #[CODE]
- Warning: yellow/orange #[CODE]
- Error: red #[CODE]
- Disabled: light gray #[CODE]
- Information: blue #[CODE]

### Color Contrast

All text must maintain at least WCAG AA contrast:

- Normal text: minimum 4.5:1.
- Large text (18pt+): minimum 3:1.

Testing tool:

- [WebAIM Contrast Checker](https://webaim.org/resources/contrastchecker/)

### Color Guardrails

- Do not use more than five primary colors.
- Do not rely on color alone to convey information.
- Do not use pure black (#000000) for main body text; prefer softer dark values like #333333.
- Test color decisions for color-vision accessibility.

## 4. Typography

### Font Family

Primary font (headlines, large text):

- Font name: [e.g., Roboto, Open Sans]
- Source: [Where to get it]
- Weights: Bold (700), Semi-bold (600), Regular (400)
- Usage: H1, H2, H3, headers, CTAs

Secondary font (body text, small text):

- Font name: [e.g., Open Sans, Lato]
- Source: [Where to get it]
- Weights: Regular (400), Light (300)
- Usage: Body paragraphs, lists, helper text

### Font Sizing And Hierarchy

Define and enforce a clear scale:

- H1: [X]px / [X]rem, weight 700, line-height [X]
- H2: [X]px / [X]rem, weight 600, line-height [X]
- H3: [X]px / [X]rem, weight 600, line-height [X]
- Body: [X]px / [X]rem, weight 400, line-height [X]
- Small: [X]px / [X]rem, weight 400, line-height [X]
- Button: [X]px / [X]rem, weight 600, line-height [X]

Example hierarchy (16px base):

```text
H1: 32px / 2rem (Bold)
H2: 24px / 1.5rem (Semi-bold)
H3: 20px / 1.25rem (Semi-bold)
Body: 16px / 1rem (Regular)
Small: 14px / 0.875rem (Regular)
```

### Line Height

- Headlines: 1.2x.
- Body text: 1.6x.
- Small text: 1.5x.

### Letter Spacing

- Headlines: 0 to -0.02em.
- Body: 0 to 0.02em.
- All caps labels: 0.1em to 0.15em.

### Font Pairing Example

```html
<h1 style="font-family: 'Roboto', sans-serif; font-size: 32px; font-weight: 700; line-height: 1.2;">Headline Using Roboto</h1>
<p style="font-family: 'Open Sans', sans-serif; font-size: 16px; font-weight: 400; line-height: 1.6;">Body text should remain comfortable to read in longer blocks.</p>
```

### Typography Guardrails

- Use no more than two to three font families.
- Do not use all caps for body paragraphs.
- Keep body text at readable sizes (typically 14px to 18px).
- Ensure responsive scaling for smaller devices.
- Preserve adequate text contrast.

## 5. Image Guidelines

### Photography Style

Define your visual style and keep it consistent.

Your photography style:

[Fill in your photography style here]

### Image Types And Usage

Hero images:

- Size: minimum 1920 x 1080px (16:9)
- Format: JPG or WebP
- Target size: 100KB to 300KB

Product images:

- Size: [Standard size] px
- Background: [White, transparent, styled]
- Format: PNG or JPG
- Target size: [Target file size]

Team and people photos:

- Size: [Standard size] px
- Background guidance: [Specify]
- Format: JPG or WebP
- Target size: [Target file size]

Icons and illustrations:

- Size: [Standard size] px
- Style: Flat, 3D, minimalist, etc.
- Format: SVG preferred, PNG acceptable
- Color: align to primary palette

### Image Optimization

- JPG: 70% to 85% quality.
- PNG: use when transparency is required.
- WebP: use where supported for efficient delivery.
- Standard images: target up to 200KB.
- Hero images: target up to 300KB.
- Provide responsive image variants.

### Image Guardrails

- Do not use low-quality or pixelated images.
- Do not use unlicensed or copyrighted media.
- Include meaningful alt text for accessibility.
- Maintain one coherent visual style.

### Image Sources

Approved sources:

- Service 1: URL
- Service 2: URL
- Custom photography contact: [Who to contact]

## 6. Icons And Buttons

### Icons

Icon library:

[Name and source, e.g., Font Awesome Pro, Material Design Icons, or custom SVG set]

Icon size standards:

- Small: 16x16px
- Standard: 24x24px
- Large: 32x32px
- Extra large: 48x48px and above

Color behavior:

- Primary: use palette primary colors.
- Hover/active: use clear tonal variation.
- Disabled: use neutral disabled tone (for example #CCCCCC).

Icon example:

```html
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#0066CC" stroke-width="2"></svg>
```

### Buttons

Primary button:

- Use for highest-priority actions (Sign Up, Get Started, Buy Now).
- Define background, text color, padding, radius, and all interaction states.

Secondary button:

- Use for lower-priority actions.
- Often outlined or subtle-filled.

Tertiary button:

- Use for minimal emphasis actions.
- Usually text-forward with a hover underline.

Button states to define:

- Default
- Hover
- Active
- Disabled
- Loading
- Focus (keyboard-visible)

Example CSS:

```css
.btn-primary {
  background-color: #0066CC;
  color: #FFFFFF;
  padding: 12px 24px;
  border-radius: 4px;
  font-weight: 600;
  border: none;
  cursor: pointer;
}

.btn-primary:hover {
  background-color: #0052A3;
}

.btn-primary:active {
  background-color: #003D7A;
}

.btn-primary:disabled {
  background-color: #CCCCCC;
  cursor: not-allowed;
}
```

## 7. Spacing And Layout

### Spacing System

Use a consistent spacing scale based on an 8px grid:

- XS: 4px
- S: 8px
- M: 16px
- L: 24px
- XL: 32px
- 2XL: 48px

Example usage:

```text
Component padding: 16px (M)
Component margin: 24px (L)
Section spacing: 48px (2XL)
```

### Grid System

Define your responsive structure:

- Column structure: [e.g., 12-column responsive grid]
- Mobile: 320px to 767px
- Tablet: 768px to 1023px
- Desktop: 1024px to 1440px
- Large desktop: 1441px and above

### Max Content Width

- Maximum content width: [Value, e.g., 1200px]

## 8. Tone Of Voice And Content Guidelines

### Brand Voice

Choose three to five adjectives.

Example:

Professional, friendly, approachable, trustworthy, innovative.

Your brand voice:

[Describe your brand voice]

### Writing Guidelines

Headline guidance:

- Start with action or benefit.
- Be specific and clear.
- Avoid jargon.
- Keep headlines short (around 70 characters max).

Body text guidance:

- Use short paragraphs.
- Prefer plain language.
- Prefer active voice.
- Break content with subheadings and bullets.
- Avoid hype language.

CTA guidance:

- Use action verbs.
- Include a clear benefit where possible.
- Keep CTA copy concise (typically two to four words).

### Tone Variations By Context

- Error message tone: helpful and clear.
- Success message tone: encouraging and concise.
- Warning tone: cautious but not alarmist.
- Help text tone: friendly and supportive.
- Legal/privacy tone: clear and transparent.

### Tone Guardrails

- Avoid excessive exclamation marks.
- Avoid all-caps emphasis.
- Avoid corporate buzzword language.
- Avoid unsubstantiated claims.
- Keep language user-centered.

### Terminology

Maintain an approved glossary:

- [Term 1]: [Definition], approved usage [phrase], avoid [phrase]
- [Term 2]: [Definition], approved usage [phrase], avoid [phrase]

## 9. Component Styles

### Forms And Input Fields

Text input baseline:

- Border: 1px solid #CCCCCC
- Padding: 12px
- Radius: 4px
- Font size: 16px
- Hover: subtle background tint
- Focus: clear border + focus treatment

Labels:

- Weight: 600
- Size: 14px
- Color: #333333
- Spacing below: 8px

### Cards

Card baseline:

- Background: #FFFFFF
- Border: 1px solid #EEEEEE
- Radius: 8px
- Padding: 24px
- Shadow: subtle elevation

Hover state:

- Slightly stronger shadow
- Optional subtle upward translate

### Navigation

Main navigation:

- Background and text colors defined by brand system
- Weight: 600
- Horizontal spacing: 16px to 24px
- Active state: visible underline or highlight

Mobile navigation:

- Use a recognizable menu trigger.
- Ensure close and back controls are obvious.
- Ensure keyboard navigation and focus order are valid.

## 10. Accessibility Requirements

Target baseline: WCAG 2.1 AA.

Color and contrast:

- Maintain minimum 4.5:1 text contrast.
- Do not rely only on color to convey meaning.

Images and icons:

- Provide meaningful alt text.
- Label icon-only controls.

Typography and structure:

- Use semantic headings and landmarks.
- Preserve valid heading hierarchy.

Interactive elements:

- Ensure full keyboard access.
- Provide visible focus states.
- Validate behavior with assistive technologies.

Accessibility testing tools:

- [WAVE Browser Extension](https://wave.webaim.org/extension/)
- [Lighthouse (Chrome DevTools)](https://developers.google.com/web/tools/lighthouse)
- [Axe DevTools](https://www.deque.com/axe/devtools/)

## 11. Application Examples

### Home Page Example

```html
<header style="background-color: #0066CC; color: #FFFFFF; padding: 48px 24px;">
  <h1 style="font-size: 32px; font-weight: 700; margin-bottom: 16px;">Welcome to [Company]</h1>
  <p style="font-size: 18px; margin-bottom: 32px;">[Your company mission statement]</p>
  <button style="background-color: #FF6600; color: #FFFFFF; padding: 12px 24px; border-radius: 4px; font-weight: 600; border: none; cursor: pointer;">Get Started</button>
</header>
```

### Contact Form Example

```html
<form style="max-width: 500px; margin: 0 auto; padding: 24px;">
  <label for="name" style="display: block; font-weight: 600; font-size: 14px; color: #333333; margin-bottom: 8px;">Full Name</label>
  <input type="text" id="name" placeholder="John Doe" style="width: 100%; padding: 12px; border: 1px solid #CCCCCC; border-radius: 4px; font-size: 16px; margin-bottom: 24px;" />

  <label for="email" style="display: block; font-weight: 600; font-size: 14px; color: #333333; margin-bottom: 8px;">Email Address</label>
  <input type="email" id="email" placeholder="john@example.com" style="width: 100%; padding: 12px; border: 1px solid #CCCCCC; border-radius: 4px; font-size: 16px; margin-bottom: 24px;" />

  <button type="submit" style="background-color: #0066CC; color: #FFFFFF; padding: 12px 24px; border-radius: 4px; font-weight: 600; border: none; cursor: pointer; width: 100%;">Send Message</button>
</form>
```

## 12. Brand Don\'ts

Never:

- Use unauthorized logo versions.
- Change brand colors without approval.
- Use unapproved fonts.
- Mix incompatible photography styles.
- Ignore accessibility requirements.
- Ignore spacing and hierarchy standards.

## 13. Resources And Files

Download resources:

- Logo files: [Link to logo downloads]
- Font files: [Link to font source]
- Color palette (Adobe, Figma, etc.): [Link to design file]
- Template files: [Link to templates]
- Icon set: [Link to icon library]

Tools and software:

- Figma (design)
- Adobe Creative Suite (design production)
- Google Fonts (font source)
- Coolors (palette support)
- Contrast Checker (accessibility validation)

Related documentation:

- [SkyCMS Templates Guide](templates.md)
- [SkyCMS Layouts Documentation](layouts.md)
- [Phase 2: Creating Layouts](../for-developers/website-launch/02-Creating-Layouts.md)
- [Phase 3: Creating Templates](../for-developers/website-launch/03-Creating-Templates.md)

Contact information:

- Design lead: [Name] - [Email] - [Phone]
- Marketing manager: [Name] - [Email] - [Phone]
- Brand owner: [Name] - [Email] - [Phone]
- Slack channel: [Channel name or N/A]

## 14. Change Log And Version Control

- Version 1.0 - [Date] - Initial style guide - [Name]

## Approval And Sign-Off

This style guide has been reviewed and approved by:

- Design Lead: [Name] - Signature: [Signature] - Date: [Date]
- Marketing Manager: [Name] - Signature: [Signature] - Date: [Date]
- Brand Owner: [Name] - Signature: [Signature] - Date: [Date]

## How To Use This Template

1. Replace all bracketed placeholders with project values.
2. Replace example values with official brand values.
3. Remove example-only notes if not needed.
4. Add or remove sections to fit organizational scope.
5. Publish assets in durable, shared locations.
6. Share and train teams on this guide.
7. Review at least annually or when brand changes.

Tips:

- Keep this document accessible to all teams.
- Use version control to track updates.
- Reference this guide during design and content reviews.
- Include this guide in onboarding for new contributors.

A strong brand is built by consistent implementation across all touchpoints.
