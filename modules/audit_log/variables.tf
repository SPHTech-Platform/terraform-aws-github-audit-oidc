variable "role_name" {
  description = "IAM Role name"
  type        = string
  default     = "github-audit-logs"
}

variable "role_description" {
  description = "IAM Role description"
  type        = string
  default     = "Used by Github to stream audit logs to S3"
}

variable "iam_boundary_arn" {
  description = "Permissions boundary ARN to use for IAM role"
  type        = string
  default     = ""
}

variable "github_enterprise" {
  description = "Name of the Github Enterprise"
  type        = string
}

variable "bucket_arn" {
  description = "ARN of the S3 bucket"
  type        = string
}
