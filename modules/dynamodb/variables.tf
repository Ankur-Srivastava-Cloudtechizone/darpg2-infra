# modules/dynamodb/variables.tf
variable "dynamodb_table_name" {
  type        = string
  description = "The name of the DynamoDB table to be used for state locking."
}

variable "tags" {
  type        = map(string)
  description = "Tags to assign to the DynamoDB table."
  default     = {}
}