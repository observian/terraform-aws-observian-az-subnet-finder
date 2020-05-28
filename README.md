# terraform-aws-observian-az-subnet-finder
Creates cidrs for subnets for all availability zones in an aws region. It will create as many groups as needed for the azs.

Usage
```hcl

module "az_subnet_finder" {
  source = "github.com/observian/terraform-aws-observian-az-subnet-finder"
  base_cidr = "10.10.0.0/16"
}

# Example Usage To Create A VPC
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name             = "RandomVPC
  cidr             = module.az_subnet_finder.base_cidr
  azs              = module.az_subnet_finder.azs
  public_subnets   = module.az_subnet_finder.subnets[0]
  private_subnets  = module.az_subnet_finder.subnets[1]
  database_subnets = module.az_subnet_finder.subnets[2]
}
```

This will create for region us-west-1 the output subnets of:
```
subnets = [
  [
    "10.10.0.0/24",
    "10.10.1.0/24",
  ],
  [
    "10.10.6.0/24",
    "10.10.7.0/24",
  ],
  [
    "10.10.12.0/24",
    "10.10.13.0/24",
  ],
  [
    "10.10.18.0/24",
    "10.10.19.0/24",
  ],
]
```