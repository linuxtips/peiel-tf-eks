terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.65.0"
    }
  }
  # backend "s3" {
  #   bucket = "peiel--tf-backend"
  # }
}

provider "aws" {
  region     = var.region
  access_key = var.aws_iam_access_key
  secret_key = var.aws_iam_secret_key
}

