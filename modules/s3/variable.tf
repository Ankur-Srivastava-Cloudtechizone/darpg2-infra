variable "bucket_name" {
  type        = string
  description = "S3 bucket name"
}

variable "tags" {
  type        = map(string)
  description = "Tags for S3 bucket"
  default     = {}
}

variable "bucket_policy" {
  type        = string
  description = "IAM policy for the S3 bucket"
}
variable "terraform_backend_role_arn" {
  description = "IAM ARN (user or role) that can access the backend"
  type        = string
}
