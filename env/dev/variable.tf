variable "aws_region" {
  description = "AWS region"
  type        = string
}


variable "s3_buckets" {
  description = "Map of S3 buckets to provision"
  type = map(object({
    force_destroy = bool
    versioning    = bool
  }))
}

variable "aws_account_id" {
  description = "AWS Account ID"
  type        = string
}


variable "dynamodb_table_name" {
  type        = string
  description = "The name of the DynamoDB table to be used for state locking."
}

variable "tags" {
  type        = map(string)
  description = "Tags to assign to the DynamoDB table."
  default     = {}
}

variable "bucket_name" {
  type        = string
  description = "Name of the S3 bucket for Terraform state"
}

variable "bucket_policy" {
  description = "Policy document for S3 bucket"
  type        = any
}

# for VPC 
variable "vpc_config" {
  description = "VPC configuration"
  type = object({
    cidr_block           = string
    enable_dns_support   = bool
    enable_dns_hostnames = bool
    tags                 = map(string)
  })
}

variable "internet_gateway_tags" {
  description = "Tags for Internet Gateway"
  type        = map(string)
}

variable "public_subnets" {
  description = "Map of public subnet configurations"
  type = map(object({
    cidr_block        = string
    availability_zone = string
    map_public_ip     = bool
    tags              = map(string)
  }))
}

variable "route_table_tags" {
  description = "Tags for route table"
  type        = map(string)
}


variable "sg_name" {
  type = string
}

variable "sg_description" {
  type = string
}

variable "sg_tags" {
  type = map(string)
}

variable "ingress_rules" {
  type = map(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "egress_rules" {
  type = map(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}


variable "instances" {
  description = "EC2 instance configurations"
  type = map(object({
    ami                         = string
    instance_type               = string
    subnet_name                 = string           # ✅ Required
    sg_name                     = string           # ✅ Required
    associate_public_ip_address = bool
    key_name                    = string
    tags                        = map(string)
  }))
}

variable "key_name" {
  description = "Key name to associate with the EC2 instance"
  type        = string
}
