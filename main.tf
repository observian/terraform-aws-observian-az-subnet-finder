terraform {
  required_version = ">= 0.12"
  required_providers {
    aws = "~> 2.7"
  }
}

# Here for testing
# provider "aws" {
#   region = "us-west-1"
# }

data "aws_availability_zones" "azs" {
  state = "available"
}

module "shared" {
  source = "../shared"
}

locals {
  az_count = length(data.aws_availability_zones.azs.names)

  # To force terraform to loop arbitrarily, this a custom list of numbers that work as indexes.
  groups = module.shared.loopable[var.num_subnet_groups]

  subnets = [
    for group in local.groups :
    [
      #This creates the next number of subnets in the cidr. It uses the index function to assing an increment number based on the az name. It then adds the az buffer and for each each additional group, the group offset.
      for name in data.aws_availability_zones.azs.names : cidrsubnet(var.base_cidr, var.cidr_bit_mask, index(data.aws_availability_zones.azs.names, name) + ((var.az_addition_buffer + local.az_count) * local.groups[group]))
    ]
  ]
}


