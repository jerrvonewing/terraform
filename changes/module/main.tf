# Variable definitions
variable "aws-region" {
  type = string
  default = "us-east-1"  
}

variable "environment" {
  type = list(string)
  default = ["dev","test","prod"]
}

# AWS resources
provider "aws" {
  region = var.aws-region
}

module "ec2" {
    source = "./ec2"
    for_each = toset(var.environment)
}