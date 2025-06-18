module "dynamodb_lock" {
  source              = "../../modules/dynamodb"
  dynamodb_table_name = "terraform-locks"
  tags = {
    Environment = "dev"
    Project     = "darpg"
  }
}


module "iam_policy" {
  source         = "../../modules/iam_policy"
  s3_bucket      = "darpg-tfstate-bucket"
  dynamodb_table = "terraform-locks"
  region         = var.aws_region
  account_id     = var.aws_account_id
}

resource "aws_iam_user_policy_attachment" "attach" {
  user       = "ankur"  # or your IAM user
  policy_arn = module.iam_policy.tf_backend_access_arn
}


module "s3_tfstate" {
  source         = "../../modules/s3"
  bucket_name    = var.bucket_name
  tags           = var.tags
  terraform_backend_role_arn = "arn:aws:iam::888184096450:user/ankur"
  bucket_policy  = jsonencode(var.bucket_policy) # move function here
}


# root main.tf
module "vpc" {
  source = "../../modules/vpc"

  aws_region             = var.aws_region
  vpc_config             = var.vpc_config
  internet_gateway_tags  = var.internet_gateway_tags
  public_subnets         = var.public_subnets
  route_table_tags       = var.route_table_tags
}


module "security_group" {
  source         = "../../modules/sg"
  sg_name        = var.sg_name
  sg_description = var.sg_description
  vpc_id         = module.vpc.vpc_id
  tags           = var.sg_tags

  ingress_rules = var.ingress_rules
  egress_rules  = var.egress_rules
}


module "key_pair" {
  source      = "../../modules/key_pair"
  key_name    = "darpg-key"
  tags        = { Name = "darpg-key" }
  bucket_name = "darpg-tfstate-bucket"
}


module "ec2_instances" {
  source   = "../../modules/ec2"
  instances = var.instances
}
