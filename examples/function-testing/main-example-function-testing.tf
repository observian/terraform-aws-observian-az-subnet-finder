terraform {
  required_version = ">= 0.13"
  required_providers {
    aws = "~> 2.7"
  }
}

provider "aws" {
  region = "us-east-1"
}

module "az_subnet_finder" {
  source = "../../../terraform-aws-observian-az-subnet-finder"
  base_cidr = var.base_cidr
  cidr_bit_mask      = 4
  az_addition_buffer = 1
  max_azs_to_use = 3
}