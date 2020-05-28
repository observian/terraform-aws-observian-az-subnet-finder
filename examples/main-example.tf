terraform {
  required_version = ">= 0.12"
  required_providers {
    aws = "~> 2.7"
  }
}

provider "aws" {
  region = "us-west-1"
}

module "az_subnet_finder" {
  source = "github.com/observian/terraform-aws-observian-az-subnet-finder"
  base_cidr = var.base_cidr
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name             = "ExampleVpc"
  cidr             = "10.10.0.0/16"
  azs              = module.az_subnet_finder.azs
  public_subnets   = module.az_subnet_finder.subnets[0]
  private_subnets  = module.az_subnet_finder.subnets[1]
  database_subnets = module.az_subnet_finder.subnets[2]
}