aws_region = "ap-south-1"

s3_buckets = {
  "darpg-tfstate-bucket" = {
    force_destroy = true
    versioning    = true
  }

  "darpg-logs-bucket" = {
    force_destroy = false
    versioning    = false
  }
}

bucket_name = "darpg-tfstate-bucket"

bucket_policy = {
  Version = "2012-10-17"
  Statement = [
    {
      Effect = "Allow"
      Principal = "*"
      Action = [
        "s3:GetObject",
        "s3:PutObject",
        "s3:DeleteObject",
        "s3:ListBucket"
      ]
      Resource = [
        "arn:aws:s3:::darpg-tfstate-bucket",
        "arn:aws:s3:::darpg-tfstate-bucket/*"
      ]
    }
  ]
}

tags = {
  Environment = "dev"
  Project     = "darpg"
}


aws_account_id = "888184096450"

dynamodb_table_name = "terraform-locks"
# tags = {
#   Environment = "dev"
#   Project     = "darpg"
# }

vpc_config = {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name        = "darpg-vpc"
    Environment = "dev"
  }
}

internet_gateway_tags = {
  Name = "darpg-igw"
}

public_subnets = {
  public1 = {
    cidr_block        = "10.0.1.0/24"
    availability_zone = "ap-south-1a"
    map_public_ip     = true
    tags = {
      Name = "darpg-public-subnet-1"
    }
  }
  public2 = {
    cidr_block        = "10.0.2.0/24"
    availability_zone = "ap-south-1b"
    map_public_ip     = true
    tags = {
      Name = "darpg-public-subnet-2"
    }
  }
}

route_table_tags = {
  Name = "darpg-public-rt"
}

sg_name        = "darpg-sg"
sg_description = "Allow HTTP, HTTPS and SSH"
sg_tags = {
  Name = "darpg-sg"
}

ingress_rules = {
  ssh = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  http = {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  https = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

egress_rules = {
  all = {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


instances = {
  ec2_1 = {
    ami                         = "ami-0f5ee92e2d63afc18"
    instance_type               = "t2.micro"
    subnet_name                 = "darpg-public-subnet-1"
    sg_name                     = "darpg-sg"
    associate_public_ip_address = true
    key_name                    = "darpg-key"
    tags = {
      Name        = "darpg-ec2-1"
      Environment = "dev"
    }
  }

  ec2_2 = {
    ami                         = "ami-0f5ee92e2d63afc18"
    instance_type               = "t2.micro"
    subnet_name                 = "darpg-public-subnet-2"
    sg_name                     = "darpg-sg"
    associate_public_ip_address = true
    key_name                    = "darpg-key"
    tags = {
      Name        = "darpg-ec2-2"
      Environment = "dev"
    }
  }

  ec2_3 = {
    ami                         = "ami-0f5ee92e2d63afc18"
    instance_type               = "t2.micro"
    subnet_name                 = "darpg-public-subnet-1"
    sg_name                     = "darpg-sg"
    associate_public_ip_address = true
    key_name                    = "darpg-key"
    tags = {
      Name        = "darpg-ec2-3"
      Environment = "dev"
    }
  }
}





key_name = "darpg-ec2-key"
