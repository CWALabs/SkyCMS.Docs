# Editor Rendering Flow

**Audience:** Backend Developers  
**Type:** Deep Dive / Reference

This document explains exactly how the SkyCMS editor serves pages at the root URL (`/`) and in preview mode. The architecture is unusual — it uses a thin shell view (`Wrapper.cshtml`) with a server-rendered iframe rather than a standard Razor layout — and that decision ripples through several areas including authentication, layout selection, and shared UI components.

---

## The Three Layout Contexts

Before diving into `HomeController`, it helps to know that the editor has three distinct layout chains. Which chain executes depends entirely on which view is returned by an action:

| Layout | Used By | AI Help Popup | Docs Help Popup |
|--------|---------|:---:|:---:|
| `_Layout.cshtml` | All standard admin pages (article lists, settings, file manager, etc.) | ✓ | ✓ |
| `_LayoutEditor.cshtml` | All page editing / designing views (`Editor/Edit`, `Editor/Designer`, `FileManager/EditCode`, `Layouts/Designer`, `Templates/Designer`, etc.) | ✓ | ✓ |
| `Wrapper.cshtml` | `HomeController.Index` only (root URL `/` and all preview requests) | — | ✓ |

`Wrapper.cshtml` sets `Layout = null`, meaning it **does not inherit from `_Layout.cshtml`**. It is a complete, self-contained HTML document.

---

## `HomeController.Index` — Step-by-Step

```
GET /  (or /?itemId=...&previewType=...)
  → HomeController.Index(lang, mode, itemId, previewType)
```

### 1. Authentication gate

```csharp
if (User.Identity?.IsAuthenticated == false)
{
    Response.Cookies.Delete("CosmosAuthCookie");
    return Redirect("~/Identity/Account/Login");
}
```

Any unauthenticated request to `/` is redirected to login. Setup middleware earlier in the pipeline may bypass this for new installations, but once the app is configured, this gate is always active.

### 2. Claims identity check

```csharp
var user = await userManager.GetUserAsync(User);
if (user == null)
{
    Response.Cookies.Delete("CosmosAuthCookie");
    return Redirect("~/Identity/Account/Logout");
}
```

The user's identity cookie exists (step 1 passed) but the user record cannot be found in the database — for example, after a database reset. The auth cookie is cleared and the user is forced to log out cleanly.

### 3. First-user auto-admin

```csharp
if (options.AllowSetup && (await dbContext.Users.CountAsync()) == 1 && !User.IsInRole("Administrators"))
{
    await userManager.AddToRoleAsync(user, "Administrators");
}
```

When setup mode is enabled and there is exactly one user who somehow lacks the `Administrators` role (for example, the role assignment failed during the setup wizard), this auto-assigns `Administrators` to them. This ensures the first user is never locked out.

### 4. Cache suppression

```csharp
Response.Headers[HeaderNames.CacheControl] = "no-store";
```

The editor home page is always served fresh. This prevents CDN and browser caches from serving stale editor state.

### 5a. Normal path — article by URL

When `previewType` is empty (normal browsing):

```csharp
ViewData["LoadEditList"] = true;
ViewData["IsPreview"] = false;

var path = HttpContext.Request.Path.Value?.TrimStart('/') ?? string.Empty;
article = await articleQueries.QueryAsync(new GetArticleByUrlQuery { UrlPath = path });
```

The request path is mapped directly to the article URL. A request to `/about` loads the article with `UrlPath = "about"`. The root `/` loads the article with `UrlPath = ""` (the home page).

**Layout auto-heal** happens just before article loading. If no default layout is configured:
- Exactly one published layout exists → it is auto-published and set as default.
- More than one published layout exists with none set as default → the user is redirected to `/Layouts/Index` with an instruction to choose one.

**404 path:** If the exact article isn't found, the controller falls back to `/not_found`. If that doesn't exist either, a plain HTTP 404 is returned.

### 5b. Preview path — by ID and type

When `itemId` and `previewType` are provided:

```csharp
ViewData["IsPreview"] = true;
ViewData["LoadEditList"] = false;

if (previewType == "editor")        // article preview
if (previewType == "layouts")       // layout preview
if (previewType == "templates")     // template preview
```

| `previewType` | Loaded via |
|---------------|-----------|
| `editor` | `GetArticleByIdQuery` using `itemId` |
| `layouts` | `GetLayoutPreview(itemId)` — renders layout HTML as a standalone article model |
| `templates` | `GetTemplatePreview(itemId)` — same approach for templates |

All three converge on `SetRenderedView(article)` and then `return View("Wrapper")`.

### 6. `SetRenderedView` — server-side pre-render

```csharp
private async Task SetRenderedView(ArticleViewModel model)
{
    var renderedView = await viewRenderService.RenderToStringAsync("~/Views/Home/Index.cshtml", model);
    ViewData["RenderedView"] = renderedView;
}
```

`IViewRenderService.RenderToStringAsync` renders `Views/Home/Index.cshtml` with the article model **in memory** — it does not write to the response. The resulting HTML string is stored in `ViewData["RenderedView"]`.

`Views/Home/Index.cshtml` is a full site page — it assembles the public-facing HTML using the article's layout, template, and content. The rendered string is essentially what a visitor to the public website would receive.

### 7. Return `Wrapper`

```csharp
return View("Wrapper");
```

Both normal and preview paths return the same `Wrapper` view.

---

## `Wrapper.cshtml` — The Shell

`Wrapper.cshtml` is a minimal HTML document:

```razor
@{
    Layout = null;   // No Razor layout inheritance
    ...
}
<!DOCTYPE HTML>
<html>
<head>
    <!-- Bootstrap, Font Awesome, jQuery, Bootstrap JS -->
</head>
<body>
    <partial name="_CosmosMainMenuPartial" />   <!-- editor top nav -->
    <partial name="_DocsHelpFloatingWindow" />  <!-- docs search popup -->

    <iframe id="iFrameWebPage"
            style="position: absolute; top: 52px; bottom: 0; width: 100%; height: calc(100vh - 52px); border: none;">
    </iframe>

    <partial name="_IframeNavigationBlockingScript" />
</body>
</html>
```

**Why an iframe?**

The `<iframe>` is populated client-side with the content of `ViewData["RenderedView"]`. The public-facing site page (with its own CSS frameworks, fonts, JavaScript, etc.) lives inside the iframe, completely isolated from the editor's Bootstrap/jQuery UI environment. This prevents stylesheet collisions and JavaScript conflicts between the editor chrome and whatever the site builder has put on the page.

The editor top-nav (`_CosmosMainMenuPartial`) sits outside the iframe, always rendered at full viewport width. Clicking "Save", "Publish", or "Preview/Publish" in that nav fires `postMessage` events into the iframe or navigates it.

**`ViewData["IsPreview"]`** toggles the menu partial: preview mode renders `_CosmosPreviewMenuPartial` (with publish scheduling controls) instead of `_CosmosMainMenuPartial`.

---

## How `ViewData["RenderedView"]` reaches the iframe

`_IframeNavigationBlockingScript.cshtml` (included at the bottom of `Wrapper`) and the JS in `Wrapper` itself load the rendered HTML into the iframe via `document.write` or `srcdoc`. The full HTML string from `SetRenderedView` becomes the iframe's document content.

This means each request to `/` results in:

1. **Server**: full public-facing HTML assembled and stored in `ViewData["RenderedView"]`.
2. **Wrapper**: sends back a thin shell document (~1 KB of editor chrome).
3. **Client**: JS injects the pre-rendered HTML into the iframe.

---

## Shared Floating Popups and the Layout Problem

Because `Wrapper.cshtml` does not inherit from `_Layout.cshtml`, any JavaScript functions defined in `_Layout.cshtml` are simply absent on the home page (`/`).

The docs help search popup (`ccmsOpenDocsHelpSearchWindow`) and its supporting functions were originally defined only in `_Layout.cshtml`. The top-nav `_LoginPartial.cshtml` check:

```javascript
onclick="if (typeof window.ccmsOpenDocsHelpSearchWindow === 'function') {
    return window.ccmsOpenDocsHelpSearchWindow();
} return true;"
```

…would fall through to the plain `href` navigation when the function was missing — sending the user to the docs website instead of opening the popup.

The solution is `_DocsHelpFloatingWindow.cshtml` — a self-contained shared partial that includes the CSS, HTML, and all the JS functions, wrapped in an IIFE with `window.ccmsOpenDocsHelpSearchWindow` exposed globally. It is included in:

- `_Layout.cshtml` — replaces the previously inline docs help block
- `_LayoutEditor.cshtml` — added after the AI help window div
- `Wrapper.cshtml` — added after `_CosmosMainMenuPartial`

This ensures the popup is available regardless of which layout context the user is in.

---

## `HomeController.DocsSearchIndex` — Docs Search Proxy

```csharp
[AllowAnonymous]
[HttpGet]
public async Task<IActionResult> DocsSearchIndex()
```

The docs search popup fetches its search data from `/Home/DocsSearchIndex`. This endpoint proxies `https://docs.sky-cms.com/search/search_index.json` — the MkDocs search index for the SkyCMS documentation site.

Using a server-side proxy instead of a direct browser `fetch` avoids CORS issues. The `[AllowAnonymous]` attribute ensures the search index can be loaded even if the anonymous flag changes for the rest of the controller.

The client-side search in `_DocsHelpFloatingWindow.cshtml` loads this index once per session, then performs all matching locally using a simple term-frequency scorer that returns the top 12 results.

---

## Request Flow Summary

```
Browser GET /
  │
  ├─ TenantSetupMiddleware / DomainMiddleware (tenant resolution)
  │
  └─ HomeController.Index()
       │
       ├─ Auth check → redirect to /login if unauthenticated
       ├─ User DB check → redirect to /logout if not found
       ├─ First-user auto-admin (if applicable)
       ├─ Cache-Control: no-store
       │
       ├─ [normal] Layout auto-heal → GetArticleByUrlQuery(path)
       │                              SetRenderedView() → ViewData["RenderedView"]
       │                              return View("Wrapper")
       │
       └─ [preview] GetArticleByIdQuery / GetLayoutPreview / GetTemplatePreview
                    SetRenderedView() → ViewData["RenderedView"]
                    return View("Wrapper")

Wrapper.cshtml (Layout = null)
  ├─ <head>: Bootstrap, jQuery, Font Awesome
  ├─ _CosmosMainMenuPartial (editor top nav, or preview nav)
  ├─ _DocsHelpFloatingWindow (floating docs search popup)
  ├─ <iframe> ← JS populates with ViewData["RenderedView"]
  └─ _IframeNavigationBlockingScript
```
