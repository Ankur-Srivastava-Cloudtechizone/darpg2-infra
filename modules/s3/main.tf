data "aws_iam_policy_document" "s3_policy" {
  statement {
    sid     = "TerraformBackendAccess"
    effect  = "Allow"

    principals {
      type        = "AWS"
      identifiers = [var.terraform_backend_role_arn]
    }

    actions = [
      "s3:GetObject",
      "s3:PutObject",
      "s3:DeleteObject",
      "s3:ListBucket"
    ]

    resources = [
      "arn:aws:s3:::${aws_s3_bucket.this.bucket}",
      "arn:aws:s3:::${aws_s3_bucket.this.bucket}/*"
    ]
  }
}


resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
  tags   = var.tags
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id

  versioning_configuration {
    status = "Enabled"
  }
}


resource "aws_s3_bucket_policy" "this" {
  bucket = aws_s3_bucket.this.id
  policy = data.aws_iam_policy_document.s3_policy.json
}


resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = false  # This is the key change
  restrict_public_buckets = true
}
