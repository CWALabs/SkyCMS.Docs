---
canonical_title: Create AWS IAM Credentials for CloudFront Cache Invalidation
description: Create least-privilege AWS IAM credentials for SkyCMS CloudFront invalidation after publish.
doc_type: How-to
product_area: configuration
user_intent: create-aws-iam-credentials-for-cloudfront-purging
audience:
  - DevOps
difficulty: intermediate
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# Create AWS IAM Credentials for CloudFront Cache Invalidation

## Summary

Use this guide when SkyCMS needs AWS credentials to trigger CloudFront cache invalidations after content is published.

## Outcome

After completing this guide, you will have a least-privilege IAM user with an access key scoped to CloudFront cache invalidation on the target distribution, ready to store as SkyCMS CDN credentials.

## What SkyCMS needs

SkyCMS needs these values for CloudFront CDN purge:

- `Access Key ID`
- `Secret Access Key`
- `Distribution ID`
- `Region` — use `us-east-1` for CloudFront API calls regardless of where your origin is located

## Before you start

- Confirm your CloudFront distribution already exists and is serving your site.
- Have an AWS account with permission to create IAM users and policies.
- CloudFront's API endpoint is global but the region you supply to the AWS SDK should be `us-east-1`.

## Step 1: Find the Distribution ID

1. Sign in to the [AWS Management Console](https://console.aws.amazon.com/).
2. Open **CloudFront** from the Services menu (or search `CloudFront` in the search bar).
3. In the **Distributions** list, locate the distribution for your site.
4. Copy the **Distribution ID** (for example, `E1ABCDEF2GHIJK`). This is not the domain name.

## Step 2: Create a least-privilege IAM policy

1. Open **IAM** from the Services menu.
2. In the left navigation, select **Policies**.
3. Select **Create policy**.
4. On the **Specify permissions** step, select the **JSON** tab.
5. Replace the default content with the following, substituting your distribution ID:

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "SkyCMSCloudFrontInvalidation",
      "Effect": "Allow",
      "Action": [
        "cloudfront:CreateInvalidation",
        "cloudfront:GetInvalidation",
        "cloudfront:ListInvalidations"
      ],
      "Resource": "arn:aws:cloudfront::ACCOUNT-ID:distribution/YOUR-DISTRIBUTION-ID"
    }
  ]
}
```

Replace `ACCOUNT-ID` with your 12-digit AWS account ID and `YOUR-DISTRIBUTION-ID` with the ID from Step 1.

1. Select **Next**.
2. Enter a descriptive name such as `SkyCMS-CloudFront-Invalidation-Production`.
3. Select **Create policy**.

To find your account ID: open the account menu in the top-right corner of the AWS console. The ID appears under your account name.

## Step 3: Create an IAM user

1. In the IAM left navigation, select **Users**.
2. Select **Create user**.
3. Enter a **User name** such as `skycms-cdn-production`.
4. Leave **Provide user access to the AWS Management Console** unchecked.
5. Select **Next**.
6. On the **Set permissions** step, select **Attach policies directly**.
7. Search for `SkyCMS-CloudFront-Invalidation-Production` and check the box next to it.
8. Select **Next**, then **Create user**.

## Step 4: Create an access key

1. On the **Users** list, select the user you just created.
2. Open the **Security credentials** tab.
3. Scroll to **Access keys** and select **Create access key**.
4. Select **Application running outside AWS**.
5. Optionally add a description tag such as `SkyCMS CloudFront invalidation key`.
6. Select **Next**, then **Create access key**.
7. Copy the **Access key** (Access Key ID) and **Secret access key**.

AWS only shows the secret access key once. Store both values immediately in your secret manager.

## Step 5: Map values into SkyCMS

Enter the following values in the SkyCMS CDN settings or set them as environment variables:

| SkyCMS setting | Value |
| --- | --- |
| `CloudFrontAccessKeyId` | Access Key ID from Step 4 |
| `CloudFrontSecretAccessKey` | Secret Access Key from Step 4 |
| `CloudFrontDistributionId` | Distribution ID from Step 1 |
| `CloudFrontRegion` | `us-east-1` |

See [CDN: CloudFront](./cloudfront.md) for the full configuration reference.

## Common mistakes

- Using the CloudFront domain name (for example, `dXXXXXXX.cloudfront.net`) instead of the distribution ID in the policy resource. The policy requires the distribution ID.
- Setting region to the origin region instead of `us-east-1`. CloudFront's API is always in `us-east-1`.
- Omitting `cloudfront:GetInvalidation` — this can cause SkyCMS to fail validation checks even if the invalidation itself succeeds.
- Granting `cloudfront:*` on `*` — this gives access to every distribution in the account.

## Validation

To verify the credentials work, you can test with the AWS CLI:

```bash
aws cloudfront create-invalidation \
  --distribution-id YOUR-DISTRIBUTION-ID \
  --paths "/*" \
  --region us-east-1
```

A successful response includes an `Invalidation` object with `Status: InProgress`.

## Key rotation

Rotate access keys periodically:

1. Create a new access key for the same user.
2. Update SkyCMS with the new values and verify invalidations work.
3. Deactivate and delete the old key.

## Related guides

- [CDN: CloudFront](./cloudfront.md)
- [CDN Overview](./overview.md)
- [CDN Configuration Reference](./configuration-reference.md)
