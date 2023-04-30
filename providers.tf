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
}

