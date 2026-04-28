---
canonical_title: Forms Helpers Widget
description: Submit forms with SkyCMS antiforgery support using client-side form helper utilities.
doc_type: How-to
product_area: site-building
user_intent: post-forms-with-antiforgery-token-from-widget-helper
audience:
  - Site Builders
  - Front-End Developers
difficulty: intermediate
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# Forms Helpers Widget

## Summary

Small helpers for posting forms with the Cosmos antiforgery token and basic element checks.

- Location (source): `Editor/wwwroot/lib/cosmos/forms.js`
- Exposed functions:
  - `ccms___ElementExists(element: any): boolean`
  - `ccms___GetXsrfToken(): Promise<string>` — fetches an antiforgery token from `/ccms__antiforgery/token` response header `XSRF-TOKEN`
  - `ccms___PostForm(endpoint: string, formName: string): Promise<Response>` — posts the named form with header `RequestVerificationToken`

## Outcome

After completing this guide, you should be able to submit forms through SkyCMS with a valid antiforgery token and clear error handling.

## Steps

1. Add a `<form>` element with a `name` attribute to your page.
2. Include `forms.js` in your layout or page template: `<script src="/lib/cosmos/forms.js"></script>`.
3. Attach a `submit` event listener that calls `event.preventDefault()`.
4. Inside the handler, call `await ccms___PostForm(endpoint, formName)` with your API endpoint and form name.
5. Check `response.ok` and surface errors to the user as needed.
6. Verify that a valid submission reaches the endpoint and passes antiforgery validation.

## Requirements

- Server endpoint `/ccms__antiforgery/token` must return a response with an `XSRF-TOKEN` header.
- Target form must be accessible via `document.forms[formName]`.

## Simple usage

```html
<form name="contactForm" id="contactForm">
  <input name="email" type="email" required />
  <textarea name="message" required></textarea>
  <button id="btnSubmit" type="submit">Send</button>
</form>

<script src="/lib/cosmos/forms.js"></script>
<script>
  document.getElementById('contactForm').addEventListener('submit', async (e) => {
    e.preventDefault();
    try {
      const resp = await ccms___PostForm('/Contact/Send', 'contactForm');
      if (!resp.ok) throw new Error('Request failed: ' + resp.status);
      alert('Thank you!');
    } catch (err) {
      console.error(err);
      alert('Sorry, please try again.');
    }
  });
</script>
```

## Notes

- `ccms___PostForm` builds a `FormData(form)` and sends it with header `RequestVerificationToken` using the value retrieved from `ccms___GetXsrfToken()`.
- Handle errors by checking `response.ok` and reading body as needed.

## Verification

This integration is complete when form submission succeeds for valid input, antiforgery validation passes, and failed requests surface actionable errors to users.

## Related guides

- [Widgets Overview](./overview.md)
- [Search Widget](./search.md)
