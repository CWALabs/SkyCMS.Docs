# Administration & Security

SkyCMS provides comprehensive administration tools for user management, role-based access control, site configuration, email, contact management, and security hardening.

**Audiences:** Administrators, Developers

**Jump to:**

- [User Management](#1-user-management)
- [Roles & Permissions](#2-roles--permissions)
- [Site Settings](#3-site-settings)
- [Email Administration](#4-email-administration)
- [Contact Management](#5-contact-management)
- [Security Features](#6-security-features)
- [Audit & Logging](#7-audit--logging)

---

## 1. User Management

> **Documentation:** [User Management Guide](../../for-editors/user-management.md) · [Roles & Permissions (Developers)](../../for-developers/roles-and-permissions.md)

### User Accounts

- Create new user accounts with email and role assignment
- View and search all users in a paginated, sortable list
- Delete users (bulk delete supported with multi-select)
- Confirm or unconfirm user email addresses manually
- Resend email confirmation messages
- Send password reset emails

### Author Profiles

- Create and manage author profiles with biographical information
- Author profile list with sorting and pagination
- Edit author details (displayed on blog posts and bylines)
- Delete author profiles

---

## 2. Roles & Permissions

> **Documentation:** [Roles & Permissions (Developers)](../../for-developers/roles-and-permissions.md)

### Built-in Roles

SkyCMS ships with six default roles:

| Role | Purpose |
|------|---------|
| **Administrator** | Full system access — user management, settings, CDN, storage, audit logs |
| **Editor** | Full content creation and publishing, template/layout management, file manager |
| **Author** | Create and edit own content, submit for review, file manager access, no direct publish |
| **Reviewer** | View content and provide feedback, no create/edit/publish capability |
| **Authenticated** | Reserved for future extensibility |
| **Anonymous** | Reserved for future extensibility |

### Permission Matrix

| Feature | Admin | Editor | Author | Reviewer |
|---------|-------|--------|--------|----------|
| Editor dashboard | Yes | Yes | Yes | Yes |
| Create pages | Yes | Yes | Yes | No |
| Edit all pages | Yes | Yes | No | No |
| Edit own pages | Yes | Yes | Yes | No |
| Publish pages | Yes | Yes | No | No |
| Delete pages | Yes | Yes | No | No |
| Manage layouts | Yes | Yes | No | No |
| Manage templates | Yes | Yes | No | No |
| File manager (full) | Yes | Yes | Yes | No |
| File manager (read) | Yes | Yes | Yes | Yes |
| Manage users | Yes | No | No | No |
| Manage roles | Yes | No | No | No |
| System settings | Yes | No | No | No |
| CDN/storage config | Yes | No | No | No |
| Email admin | Yes | Yes | No | No |
| Contact management | Yes | Yes | No | No |

### Custom Roles

- Create custom roles with arbitrary names
- Delete custom roles (bulk delete)
- Assign users to multiple roles simultaneously
- View users assigned to a specific role

### Per-Article Permissions

- Assign specific identity objects (users/groups) to individual articles
- Restrict article access beyond role-based rules
- Paginated permission management interface

---

## 3. Site Settings

> **Documentation:** [Site Settings Guide](../../for-editors/site-settings.md) · [Configuration Overview](../../configuration/overview.md) · [Proxy Settings](../../configuration/proxy-settings.md)

### General Settings

- Configure site-wide properties from the admin dashboard
- Settings stored per tenant in multi-tenant deployments
- Environment-variable override for deployment-time configuration

### CDN Configuration

- Configure CDN provider and credentials
- Supported providers: Azure CDN, Cloudflare, AWS CloudFront, Sucuri
- Remove CDN configuration
- CDN settings isolated per tenant

### Copilot Configuration

- Enable/disable AI Copilot per tenant
- Configure endpoint, model, access token
- Tuning: temperature, max tokens, timeout
- Status endpoint for client-side feature discovery

---

## 4. Email Administration

> **Documentation:** [Email Overview](../../configuration/email/overview.md) · [Azure Communication Services](../../configuration/email/azure-communication-services.md) · [SendGrid](../../configuration/email/sendgrid.md) · [SMTP](../../configuration/email/smtp.md) · [NoOp Provider](../../configuration/email/none.md) · [Email Configuration Reference](../../configuration/email/configuration-reference.md) · [Email Environment Variables](../../configuration/email/environment-variables.md)

### Email Provider Configuration

Multiple email service providers supported:

| Provider | Description |
|----------|-------------|
| **Azure Communication Services** | Azure-native email delivery |
| **SendGrid (Twilio)** | Commercial email with template support |
| **SMTP** | Self-hosted with TLS and authentication |
| **NoOp** | Development/test mode (no emails sent) |

### Email Features

- Dynamic provider selection via configuration
- Provider auto-detected from connection string
- ASP.NET Core Identity integration (confirmation, password reset emails)
- Test email form — send a test message to verify configuration
- DI registration via `AddCosmosEmailServices()`

---

## 5. Contact Management

> **Documentation:** [Contact Management Guide](../../for-editors/contact-management.md) · [Contact Form API](../../for-developers/api/contact-form.md) · [Contact Form Example](../../for-developers/api/contact-form-example.md)

### Contact Form Submissions

- View all contact form submissions
- Paginated contact list with JSON API
- Export contacts as CSV download
- Enable/disable contact alert notifications

### Contact Form API

- Public endpoint: `POST /_api/contact/submit`
- reCAPTCHA validation: `POST /_api/contact/captcha-validate`
- Anti-forgery token validation
- Rate limited: 3 requests / 5 minutes (production), 20 requests / 1 minute (development)
- Email delivery to site administrators on submission

### MailChimp Integration

- Connect to MailChimp for automatic contact list sync
- Configure MailChimp API settings
- Remove MailChimp integration

---

## 6. Security Features

> **Documentation:** [Authentication & SSO Guide](../../for-editors/authentication.md) · [Roles & Permissions](../../for-developers/roles-and-permissions.md)

### Authentication

- **ASP.NET Core Identity** — Full registration, login, password management
- **Email confirmation** — Required email verification for new accounts
- **Two-factor authentication (2FA)** — TOTP-based second factor
- **Password reset** — Self-service and admin-initiated password reset flows
- **Passkey / FIDO2** — WebAuthn-based passwordless authentication
- **OAuth / SSO** — Microsoft account and Google sign-in
- **Azure AD / Entra ID** — Enterprise SSO with group-based authorization
- **Azure B2C** — Customer identity and access management

### Microsoft Graph Integration

- Azure AD group membership verification
- Claims transformation for user context enrichment (`MsGraphClaimsTransformation`)
- Group-based authorization requirements (`GroupAuthorizationRequirement`)
- Policy-based authorization handler (`HandlerUsingAzureGroups`)

### Authorization

- Controller-level `[Authorize]` attributes on all editor endpoints
- Role-based access control on every controller action
- Custom authorization handler for Azure AD groups
- Per-article permission checks via `IArticlePermissions`

### Anti-Forgery Protection

- Anti-forgery tokens on all form submissions
- Token validation middleware
- Per-tenant token scoping via HttpContext

### Rate Limiting

Built-in rate limiting policies to prevent abuse:

| Policy | Limit | Scope |
|--------|-------|-------|
| `contact-form` | 3 req / 5 min (prod), 20 req / 1 min (dev) | Contact form submissions |
| `deployment` | 10 req / 5 min | SPA deployment API |
| `docs-import` | Configurable | Docs import API |
| `copilot-inline` | Configurable | Copilot completion requests |

### SPA Deployment Security

- Deployment API with password/key authentication
- BCrypt-hashed deployment keys
- Key rotation support
- Rate-limited deployment endpoint

### Cookie Security

- Cookie domain scoped via `CookieDomain` claim
- Per-tenant cookie isolation
- Secure cookie configuration

### Data Protection

- Personal data encryption for sensitive user fields
- Encryption key management (`GetEncryptionKey` endpoint)

---

## 7. Audit & Logging

> **Documentation:** [Audit & Logging Guide](../../for-developers/audit-logging.md)

### Activity Logs

- Article activity log tracking changes, saves, publishes
- View logs from the editor dashboard
- Structured logging throughout the application
- Audit trail for content lifecycle events

### Health Checks

- Database connectivity health check
- System status monitoring
- Used by load balancers and orchestrators for readiness/liveness probes
