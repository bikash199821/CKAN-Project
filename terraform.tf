terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 4.6.0"
     }
  }
 
}

# Terraform Provider Block
provider "aws" {
  region = var.aws_region
}