output "iam_role_arn" {
  description = "IAM Role ARN for Github to assume"
  value       = module.github_role.iam_role_arn
}
