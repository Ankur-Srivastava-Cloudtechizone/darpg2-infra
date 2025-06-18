variable "s3_bucket" {
  type        = string
  description = "S3 bucket name for Terraform backend"
}

variable "dynamodb_table" {
  type        = string
  description = "DynamoDB table name for state locking"
}

variable "region" {
  type        = string
  description = "AWS Region"
}

variable "account_id" {
  type        = string
  description = "AWS Account ID"
}
