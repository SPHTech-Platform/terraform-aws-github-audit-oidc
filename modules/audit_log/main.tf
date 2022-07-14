resource "aws_iam_openid_connect_provider" "github" {
  url = "https://oidc-configuration.audit-log.githubusercontent.com"

  client_id_list = [
    "sts.amazonaws.com",
  ]
  thumbprint_list = [
    "7e6db7b7584d8cf2003e0931e6cfc41a3a62d3df", # Generate with `thumbprint.sh`
  ]
}

module "github_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
  version = "~> 5.2.0"

  create_role = true

  role_name        = "github-audit-logs"
  role_description = "Used by Github to stream audit logs to S3"

  role_permissions_boundary_arn = var.iam_boundary_arn

  provider_url = aws_iam_openid_connect_provider.github.url
  oidc_fully_qualified_subjects = [
    "https://github.com/${var.github_enterprise}", # Enterprise Name
  ]
  oidc_fully_qualified_audiences = [
    "sts.amazonaws.com",
  ]
}

data "aws_iam_policy_document" "audit_bucket" {
  statement {
    actions = ["s3:PutObject"]
    #tfsec:ignore:aws-iam-no-policy-wildcards
    resources = [
      "${var.bucket_arn}/*",
    ]
  }
}

resource "aws_iam_role_policy" "audit_bucket" {
  role   = module.github_role.iam_role_name
  policy = data.aws_iam_policy_document.audit_bucket.json
}
