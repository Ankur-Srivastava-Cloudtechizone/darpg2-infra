variable "aws_region" {
  description = "AWS region"
  type        = string
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

