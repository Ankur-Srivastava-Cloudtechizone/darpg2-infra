terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# variable "aws_region" {
#   type        = string
#   default     = "ap-south-1"
#   description = "AWS Region"
# }


# terraform {
#   backend "s3" {
#     bucket         = "darpg-tfstate-bucket"            # ✅ Replace with your bucket
#     key            = "env/dev/terraform.tfstate"       # ✅ tfstate path inside bucket
#     region         = "ap-south-1"                       # ✅ your bucket region
#     encrypt        = true
#     dynamodb_table = "terraform-locks"                 # ✅ optional, for locking
#   }
# }

# provider "aws" {
#   region = var.aws_region
# }
