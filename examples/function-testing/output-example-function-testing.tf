output "subnets" {
    value = module.az_subnet_finder.subnets
}

output "az_count" {
    value = module.az_subnet_finder.az_count
}

output "groups" {
    value = module.az_subnet_finder.groups
}

output "azs" {
  value = module.az_subnet_finder.azs
}
