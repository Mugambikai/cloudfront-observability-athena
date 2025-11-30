terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

variable "region" {
  type    = string
  default = "us-east-1"
}

resource "aws_s3_bucket" "cloudfront_logs" {
  bucket = "cf-logs-${replace(uuid(), "-", "")}"
  acl    = "private"

  tags = {
    Name = "cloudfront-logs-bucket"
    Env  = "dev"
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  lifecycle_rule {
    enabled = true
    expiration {
      days = 365
    }
  }
}

output "cloudfront_logs_bucket" {
  value = aws_s3_bucket.cloudfront_logs.id
}
