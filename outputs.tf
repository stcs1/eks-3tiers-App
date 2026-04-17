output "vpc_id" {
  description = "vpc id"
  value = module.vpc.default_vpc_id
}

output "private_subnets" {
    description = "private subnets"
    value = module.vpc.private_subnets
}

output "public_subnets" {
  description = "public subnets"
  value = module.vpc.public_subnets
}

output "database_subnets" {
  description = "database subnets"
  value = module.vpc.database_subnets
}

output "cidr_block" {
  description = "vpc cidr"
  value = module.vpc.default_vpc_cidr_block
}