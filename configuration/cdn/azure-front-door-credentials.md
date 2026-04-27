<!-- Audience: DevOps -->
<!-- Type: How-to -->

# Set Up Azure Front Door Credentials for Cache Purge

Use this guide when SkyCMS needs to purge the Azure Front Door cache after content is published.

## What SkyCMS needs

SkyCMS uses a service principal with the appropriate RBAC role to call the Azure Front Door purge API. The required values are:

- `Tenant ID` (also called Directory ID)
- `Client ID` (also called Application ID)
- `Client secret`
- `Subscription ID`
- `Resource group name`
- `Front Door profile name`
- `Endpoint name`

## Before you start

- Confirm the Azure Front Door Standard or Premium profile already exists and is serving your site. This guide does not cover creating a Front Door profile.
- Have an Azure account with permission to create app registrations in Microsoft Entra ID and assign RBAC roles on Azure resources.
- Classic Azure CDN (non-AFD) uses a different purge flow. This guide covers Azure Front Door Standard and Premium only.

## Step 1: Find the Front Door resource details

You will need the subscription ID, resource group, profile name, and endpoint name.

1. Sign in to the [Azure portal](https://portal.azure.com/).
2. In the top search bar, search for `Front Door` and select **Front Door and CDN profiles**.
3. Select your Front Door profile.
4. On the **Overview** page, note the **Resource group** and **Profile name**.
5. In the left menu, select **Endpoints** and note the **Endpoint name** for the endpoint SkyCMS publishes to.
6. To find the **Subscription ID**: open the subscription from the breadcrumb at the top of the portal, or search for `Subscriptions` and select your subscription to see its ID.

## Step 2: Register an app in Microsoft Entra ID

1. In the Azure portal, search for `Microsoft Entra ID` and select it.
2. In the left menu, select **App registrations**.
3. Select **New registration**.
4. Enter a **Name** such as `SkyCMS Front Door Cache Purge - Production`.
5. Under **Supported account types**, select **Accounts in this organizational directory only**.
6. Leave **Redirect URI** blank.
7. Select **Register**.

After registration, you land on the app's overview page. Note:

- **Application (client) ID** — this is the `Client ID`.
- **Directory (tenant) ID** — this is the `Tenant ID`.

## Step 3: Create a client secret

1. In the left menu of the app registration, select **Certificates & secrets**.
2. Select the **Client secrets** tab.
3. Select **New client secret**.
4. Enter a **Description** such as `SkyCMS production purge secret`.
5. Choose an **Expires** period. Use a period that fits your team's secret rotation schedule (for example, `12 months` or `24 months`).
6. Select **Add**.
7. Copy the **Value** column immediately. This is the `Client secret`.

Azure only shows the secret value once. Store it in your secret manager before leaving this page. The **Secret ID** column is not the value you need.

## Step 4: Assign the CDN Profile Contributor role

The `CDN Profile Contributor` built-in role allows the service principal to manage Front Door profiles and endpoints, including cache purge operations.

1. In the Azure portal, navigate back to your Front Door profile (search for **Front Door and CDN profiles** and select your profile).
2. In the left menu, select **Access control (IAM)**.
3. Select **Add**, then **Add role assignment**.
4. On the **Role** tab, search for `CDN Profile Contributor` and select it.
5. Select **Next**.
6. On the **Members** tab, ensure **Assign access to** is set to **User, group, or service principal**.
7. Select **Select members**.
8. Search for the app registration name you created in Step 2 (for example, `SkyCMS Front Door Cache Purge - Production`).
9. Select the app, then select **Select**.
10. Select **Review + assign**, review the summary, and select **Review + assign** again to confirm.

## Step 5: Map values into SkyCMS

Enter the following values in the SkyCMS CDN settings or set them as environment variables:

| SkyCMS setting | Value |
| --- | --- |
| `AzureTenantId` | Tenant ID from Step 2 |
| `AzureClientId` | Client ID from Step 2 |
| `AzureClientSecret` | Client secret Value from Step 3 |
| `AzureSubscriptionId` | Subscription ID from Step 1 |
| `AzureResourceGroup` | Resource group name from Step 1 |
| `AzureFrontDoorProfileName` | Profile name from Step 1 |
| `AzureFrontDoorEndpointName` | Endpoint name from Step 1 |

See [CDN: Azure Front Door](./azure-front-door.md) for the full configuration reference.

## Common mistakes

- Copying the **Secret ID** instead of the **Value** from the Certificates & secrets page. The Secret ID is a GUID for management; the Value is the actual credential.
- Assigning the role at the subscription or resource group scope instead of the Front Door profile scope. Scoping to the profile is least privilege for this use case.
- Using the Classic Azure CDN profile type. Azure Front Door Standard/Premium and Classic CDN have different purge APIs; confirm the profile type is **Standard** or **Premium** on the overview page.
- Forgetting to note the secret value immediately — Azure does not show it again after you leave the page.

## Secret rotation

Client secrets expire. Set a calendar reminder for before the expiry date.

To rotate:

1. Create a new client secret on the same app registration.
2. Update SkyCMS with the new secret value.
3. Verify purge operations succeed.
4. Return to **Certificates & secrets** and delete the old secret.

## Related guides

- [CDN: Azure Front Door](./azure-front-door.md)
- [CDN Overview](./overview.md)
- [CDN Configuration Reference](./configuration-reference.md)
