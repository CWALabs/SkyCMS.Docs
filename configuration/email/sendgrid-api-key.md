<!-- Audience: Developers and Administrators -->
<!-- Type: How-to -->

# Create a SendGrid API Key

Use this guide when SkyCMS needs a SendGrid API key to send transactional email such as contact form notifications, account emails, or workflow alerts.

## What SkyCMS needs

SkyCMS needs one value for SendGrid email delivery:

- `API key`

The API key is a 69-character string that SkyCMS includes as the `Authorization: Bearer` header on every send request.

## Before you start

- Confirm your SendGrid account is active and your sender identity (domain or single sender) is verified. Unverified senders will cause delivery failures even with a valid API key.
- Decide on the permission scope: SkyCMS only needs **Mail Send** access, not full account access.

## Step 1: Open the API Keys page

1. Sign in to [SendGrid](https://app.sendgrid.com/).
2. In the left navigation bar, select **Settings**.
3. Select **API Keys**.

## Step 2: Create the API key

1. Select **Create API Key**.
2. Enter a name for the key such as `SkyCMS Transactional - Production`.
3. Under **API Key Permissions**, select **Restricted Access**.

Selecting **Restricted Access** is important. Full Access grants the key permission to modify account settings, billing, and other areas SkyCMS does not need.

4. Scroll down to the permissions list. Locate **Mail Send**.
5. Set **Mail Send** to **Full Access**. All other categories can remain at **No Access**.
6. Select **Create & View**.
7. Copy the displayed API key immediately.

SendGrid shows the API key exactly once. Store it in your secret manager before closing this page. You cannot retrieve the value again — only revoke and recreate.

## Step 3: Map the value into SkyCMS

Enter the API key in the SkyCMS email settings or set it as an environment variable:

| SkyCMS setting | Value |
| --- | --- |
| `SendGridApiKey` | API key from Step 2 |
| `EmailFromAddress` | Your verified sender address |
| `EmailFromName` | Display name for outbound emails |

The provider mode must also be set to `SendGrid`. See [Email: SendGrid](./sendgrid.md) for the full configuration reference.

## Verify the key works

After entering the key in SkyCMS, use the send test option in email settings to confirm delivery. You can also test directly with curl:

```bash
curl --request POST \
  --url https://api.sendgrid.com/v3/mail/send \
  --header 'Authorization: Bearer YOUR_API_KEY_HERE' \
  --header 'Content-Type: application/json' \
  --data '{"personalizations":[{"to":[{"email":"test@example.com"}]}],"from":{"email":"sender@yourdomain.com"},"subject":"SkyCMS test","content":[{"type":"text/plain","value":"Test message"}]}'
```

A `202 Accepted` response indicates the key is valid and the message was accepted for delivery.

## Common mistakes

- Choosing **Full Access** instead of **Restricted Access**. A Full Access key can read account data, modify settings, and manage billing. Use Restricted Access for least privilege.
- Not verifying the sender domain or address. A valid API key does not override unverified sender requirements. Check **Settings** → **Sender Authentication** to confirm the sender is verified.
- Storing the API key in a source-controlled config file. Use environment variables or a secret manager.

## Key rotation

SendGrid API keys do not expire automatically. Rotate them periodically or immediately if a key is suspected to be compromised.

To rotate:

1. Return to **Settings** → **API Keys**.
2. Select **Create API Key** and repeat Step 2 with the same permissions.
3. Update SkyCMS with the new key.
4. Verify email delivery works.
5. On the API Keys list, select the action menu for the old key and select **Delete**.

## Related guides

- [Email: SendGrid](./sendgrid.md)
- [Email Overview](./overview.md)
- [Email Configuration Reference](./configuration-reference.md)
