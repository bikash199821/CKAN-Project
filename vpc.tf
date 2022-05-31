# Create VPC Terraform Module
data "aws_availability_zones" "available" {
}
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  #version = "3.11.0"
  #version = "3.14.0"

  # VPC Basic Details
  name = var.vpc_name
  cidr = var.vpc_cidr_block
  azs             = data.aws_availability_zones.available.names
  public_subnets  = var.vpc_public_subnets
  
  vpc_tags = {
    Type = "prod-vpc"       
  }

  # Additional Tags to Subnets
  public_subnet_tags = {
    Type = "Public Subnets"       
  }
}