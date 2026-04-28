---
canonical_title: Create AWS IAM Credentials for S3
description: Create least-privilege AWS IAM credentials for SkyCMS S3-compatible storage access.
doc_type: How-to
product_area: configuration
user_intent: create-aws-iam-credentials-for-skycms-s3
audience:
  - DevOps
difficulty: intermediate
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# Create AWS IAM Credentials for S3

## Summary

Use this guide when SkyCMS needs AWS credentials to read and write objects in an S3 bucket used for media storage or asset delivery.

## What SkyCMS needs

SkyCMS needs these values for S3 storage:

- `Access Key ID`
- `Secret Access Key`
- `Bucket name`
- `Region` (for example, `us-east-1`)
- Optional: `Endpoint URL` if using a non-AWS S3-compatible service

## Before you start

- Confirm the target S3 bucket already exists or know the exact name you will create.
- Have an AWS account with permission to create IAM users and policies.
- Decide whether you will use a dedicated IAM user (recommended for CI/CD) or AWS IAM Identity Center (recommended for human operators on newer AWS setups).

This guide covers creating a dedicated IAM user with access keys, which is the standard approach for server-side automation like SkyCMS.

## Step 1: Create a least-privilege IAM policy

1. Sign in to the [AWS Management Console](https://console.aws.amazon.com/).
2. Open **IAM** from the Services menu (or search for `IAM` in the search bar).
3. In the left navigation, select **Policies**.
4. Select **Create policy**.
5. On the **Specify permissions** step, select the **JSON** tab.
6. Replace the default content with the following, substituting your exact bucket name:

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "SkyCMSBucketAccess",
      "Effect": "Allow",
      "Action": [
        "s3:GetObject",
        "s3:PutObject",
        "s3:DeleteObject"
      ],
      "Resource": "arn:aws:s3:::YOUR-BUCKET-NAME/*"
    },
    {
      "Sid": "SkyCMSBucketList",
      "Effect": "Allow",
      "Action": "s3:ListBucket",
      "Resource": "arn:aws:s3:::YOUR-BUCKET-NAME"
    }
  ]
}
```

1. Select **Next**.
2. On the **Review and create** step, enter a descriptive name such as `SkyCMS-S3-Production`.
3. Select **Create policy**.

Do not grant `s3:*` unless you have a specific operational reason. The actions above are the minimum required for SkyCMS upload, download, and delete flows.

## Step 2: Create an IAM user

1. In the IAM left navigation, select **Users**.
2. Select **Create user**.
3. Enter a **User name** such as `skycms-storage-production`.
4. Leave **Provide user access to the AWS Management Console** unchecked. SkyCMS only needs programmatic access, not console sign-in.
5. Select **Next**.
6. On the **Set permissions** step, select **Attach policies directly**.
7. Search for the policy name you created in Step 1, for example `SkyCMS-S3-Production`.
8. Check the box next to the policy.
9. Select **Next**.
10. Review the summary and select **Create user**.

## Step 3: Create an access key

1. On the **Users** list, select the user you just created.
2. Open the **Security credentials** tab.
3. Scroll to **Access keys** and select **Create access key**.
4. On the **Access key best practices & alternatives** step, select **Application running outside AWS**.
5. Optionally enter a **Description tag** such as `SkyCMS production storage key`.
6. Select **Next**, then select **Create access key**.
7. Copy the **Access key** value. This is the `Access Key ID`.
8. Copy the **Secret access key** value. This is the `Secret Access Key`.

AWS only shows the secret access key once. Store it immediately in your secret manager before closing this page.

## Step 4: Find the region and bucket values

- **Region**: the AWS region where the bucket resides, shown in the S3 console bucket list (for example, `us-east-1`, `eu-west-1`). Use the region code, not the region display name.
- **Bucket name**: the exact bucket name as it appears in the S3 console.

## Step 5: Map values into SkyCMS

Enter the following values in the SkyCMS storage settings or set them as environment variables:

| SkyCMS setting | Value |
| --- | --- |
| `S3AccessKeyId` | Access Key ID from Step 3 |
| `S3SecretAccessKey` | Secret Access Key from Step 3 |
| `S3BucketName` | Bucket name from Step 4 |
| `S3Region` | Region code from Step 4 |
| `S3Endpoint` | Leave blank for standard AWS S3 |

See [Storage: S3-Compatible](./s3.md) for the full connection string format.

## Common mistakes

- Entering the region display name (`US East (N. Virginia)`) instead of the region code (`us-east-1`). Use the code.
- Granting `s3:*` on `*` — this gives access to every bucket in the account. Scope the policy to the specific bucket ARN.
- Not listing `s3:ListBucket` on the bucket resource (without the trailing `/*`) — this causes 403 errors on list operations even when object-level permissions are correct.
- Storing the secret access key in source-controlled config files. Use environment variables or a secret manager.

## Key rotation

AWS access keys do not expire by default. Set a calendar reminder to rotate them periodically. To rotate:

1. Create a new access key for the same user (maximum 2 active at a time).
2. Update SkyCMS with the new values.
3. Verify SkyCMS operates normally.
4. Return to **Security credentials** and select **Deactivate**, then **Delete** on the old key.

## Related guides

- [Storage: S3-Compatible](./s3.md)
- [Storage Overview](./overview.md)
- [Storage Configuration Reference](./configuration-reference.md)
