<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_github_role"></a> [github\_role](#module\_github\_role) | terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc | ~> 5.2.0 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_openid_connect_provider.github](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_openid_connect_provider) | resource |
| [aws_iam_policy_document.audit_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_arn"></a> [bucket\_arn](#input\_bucket\_arn) | ARN of the S3 bucket | `string` | n/a | yes |
| <a name="input_github_enterprise"></a> [github\_enterprise](#input\_github\_enterprise) | Name of the Github Enterprise | `string` | n/a | yes |
| <a name="input_iam_boundary_arn"></a> [iam\_boundary\_arn](#input\_iam\_boundary\_arn) | Permissions boundary ARN to use for IAM role | `string` | `""` | no |
| <a name="input_role_description"></a> [role\_description](#input\_role\_description) | IAM Role description | `string` | `"Used by Github to stream audit logs to S3"` | no |
| <a name="input_role_name"></a> [role\_name](#input\_role\_name) | IAM Role name | `string` | `"github-audit-logs"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->