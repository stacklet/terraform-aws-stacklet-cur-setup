# terraform-aws-stacklet-cur-setup
Cost and Usage Report (CUR) setup for Stacklet customers

This repository provides automation for setting up a CUR in your organizational account in such a way that the Stacklet platform, running in a different account, can access and use the CUR data.

More background information, along with instructions for accomplishing the same thing via the AWS console, can be found in the Stacklet documentation.

## AWS

### Overview

The terraform in this repository is meant to be applied in your organization's payer account, independent of any account in which the Stacklet platform is running, and must be applied by a role that has permissions to create a new CUR in the AWS billing console.

It does the following:

* Creates an S3 bucket named `<customer-prefix>-stacklet-shared-cur` in your organization's account
* Creates an hourly CUR, with resource IDs, in parquet format, which is written to the S3 bucket
* Grants limited read permissions to the S3 bucket, by the `<customer-prefix>-cur-read` role in the Stacklet platform SAAS account

This setup ensures that the CUR is in the format required by Stacklet, and that the Stacklet platform SAAS account can read CUR data in the correct S3 bucket.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.13.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 6.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 6.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cur_report_definition.stacklet_shared_cur_report](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cur_report_definition) | resource |
| [aws_s3_bucket.cur_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_ownership_controls.bucket_ownership](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_ownership_controls) | resource |
| [aws_s3_bucket_policy.s3-bucket-cur-report-policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_public_access_block.block_public_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.cur_bucket_encryption_config](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_customer_prefix"></a> [customer\_prefix](#input\_customer\_prefix) | Stacklet provided customer prefix | `string` | n/a | yes |
| <a name="input_stacklet_saas_account_id"></a> [stacklet\_saas\_account\_id](#input\_stacklet\_saas\_account\_id) | Stacklet provided SaaS Account ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_output"></a> [output](#output\_output) | n/a |
<!-- END_TF_DOCS -->

## Usage

```hcl
module "cur-setup" {
  source = "github.com/stacklet/terraform-aws-stacklet-cur-setup"
  customer_prefix = ""
  stacklet_saas_account_id = ""
}
```
