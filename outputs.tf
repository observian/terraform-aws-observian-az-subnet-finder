output "az_count" {
  value = local.az_count
}

output "azs" {
  value = slice(data.aws_availability_zones.azs.names, 0, local.set_size)
}

output "available_region_azs" {
  value = data.aws_availability_zones.azs.names
}

output "groups" {
  value = local.groups
}

output "subnets" {
  value = local.subnets
}

output "base_cidr" {
  value = var.base_cidr
} 