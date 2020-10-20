
# Here for testing
# provider "aws" {
#   region = "us-west-1"
#   # region = "us-east-1"
# }

data "aws_availability_zones" "azs" {
  state = "available"
}

module "shared" {
  source = "github.com/observian/terraform-any-observian-shared"
}

locals {
  az_count = min(length(data.aws_availability_zones.azs.names), var.max_azs_to_use)

  # To force terraform to loop arbitrarily, this a custom list of numbers that work as indexes.
  groups = module.shared.loopable[var.num_subnet_groups]

  set_size= min(var.max_azs_to_use, (var.az_addition_buffer + local.az_count))

  subnets = [
    for group in local.groups :
    [
      #This creates the next number of subnets in the cidr. It uses the index function to assing an increment number based on the az name. It then adds the az buffer and for each each additional group, the group offset.
      for name in slice(data.aws_availability_zones.azs.names, 0, local.set_size) : cidrsubnet(var.base_cidr, var.cidr_bit_mask, index(data.aws_availability_zones.azs.names, name) + (local.set_size * local.groups[group]))
    ]
  ]
}


