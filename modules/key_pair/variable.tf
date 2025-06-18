variable "key_name" {
  description = "Name for the key pair"
  type        = string
}

variable "tags" {
  description = "Tags for the key pair"
  type        = map(string)
}

variable "bucket_name" {
  description = "S3 bucket to store the private key"
  type        = string
}
