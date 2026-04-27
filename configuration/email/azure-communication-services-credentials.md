<!-- Audience: Developers and Administrators -->
<!-- Type: How-to -->

# Get Azure Communication Services Credentials

Use this guide when SkyCMS needs a connection string to send email through Azure Communication Services (ACS).

## What SkyCMS needs

SkyCMS uses an ACS connection string to authenticate against the email send API. The required value is:

- `Connection string`

The connection string bundles the endpoint and the access key into a single value.

## Before you start

- Confirm an Azure Communication Services resource already exists in your Azure subscription, or plan to create one. This guide covers both.
- Confirm a verified sender domain or email address is set up in the ACS resource. The connection string alone is not sufficient for delivery — the sender must be verified separately.
- Have an Azure account with at least **Contributor** access on the target resource group.

## Step 1: Create the ACS resource (if it does not already exist)

Skip this step if the resource already exists.

1. Sign in to the [Azure portal](https://portal.azure.com/).
2. In the top-left corner, select **+ Create a resource**.
3. In the search box, enter `Communication Services` and select **Communication Services** from the results.
4. Select **Create**.
5. Fill in the required fields:
   - **Subscription**: select your subscription.
   - **Resource group**: select an existing resource group or create a new one. You cannot create a resource group and a Communication Services resource at the same time — create the resource group first if needed.
   - **Resource name**: enter a name such as `skycms-acs-production`.
   - **Data location**: select the geography for your data residency requirements.
6. Select **Review + create**, then **Create**.

Wait for the deployment to complete (typically under one minute).

## Step 2: Open the resource and copy the connection string

1. In the Azure portal, search for `Azure Communication Services` in the top search bar and select it.
2. Select your Communication Services resource.
3. In the left menu, select **Keys**.
4. Under **Primary key**, find the **Connection string** field.
5. Select the **Copy** button to copy the connection string.

The connection string looks like:

```text
endpoint=https://skycms-acs-production.communication.azure.com/;accesskey=XXXX==
```

Store this value immediately in your secret manager. Do not paste it into source-controlled configuration files.

Both the **Primary key** and **Secondary key** connection strings work. Use the secondary key only when rotating the primary.

## Step 3: Verify the sender domain or address

A valid connection string alone does not authorize email delivery. You also need a verified sender.

1. In the left menu of the ACS resource, select **Email** → **Domains**.
2. If a domain is already verified, confirm the sender address you plan to use is within that domain.
3. If no domain is verified, you can use the Azure-managed domain (suitable for testing) or add a custom domain for production.

See the [Azure Communication Services email documentation](https://learn.microsoft.com/en-us/azure/communication-services/concepts/email/email-overview) for domain verification steps.

## Step 4: Map values into SkyCMS

Enter the following values in the SkyCMS email settings or set them as environment variables:

| SkyCMS setting | Value |
| --- | --- |
| `AcsConnectionString` | Connection string from Step 2 |
| `EmailFromAddress` | Verified sender address from Step 3 |
| `EmailFromName` | Display name for outbound emails |

The provider mode must also be set to `Azure Communication Services`. See [Email: Azure Communication Services](./azure-communication-services.md) for the full configuration reference.

## Key rotation

ACS provides two access keys (primary and secondary) so you can rotate without downtime:

1. Update SkyCMS to use the **Secondary key** connection string (under **Keys** → **Secondary key** → **Connection string**).
2. Verify SkyCMS email delivery works with the secondary key.
3. Return to **Keys** and select **Regenerate** next to the primary key.
4. Update SkyCMS back to the new **Primary key** connection string.

## Common mistakes

- Copying only the **Access key** (the raw base64 value) instead of the full **Connection string**. SkyCMS requires the complete connection string in the `endpoint=...;accesskey=...` format.
- Sending from an unverified address. ACS rejects send requests from senders not associated with a verified domain on the resource.
- Storing the connection string in source-controlled files. Use environment variables or Azure Key Vault.

## Related guides

- [Email: Azure Communication Services](./azure-communication-services.md)
- [Email Overview](./overview.md)
- [Email Configuration Reference](./configuration-reference.md)
