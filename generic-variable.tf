variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type = string
  default = "eu-west-2"  
}
variable "environment" {
  description = "Environment Variable used as a prefix"
  type = string
  default = "prod"
}
