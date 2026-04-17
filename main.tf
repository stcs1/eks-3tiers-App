#aws availability zones data source
data "aws_availability_zones" "available" {
  state = "available"
}

#create VPC Terraform Module
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "6.6.1"

#vpc details
  name = "${local.name}-vpc"
  cidr = var.vpc_cidr
  azs = data.aws_availability_zones.available.names
  public_subnets = var.public_subnets
  private_subnets = var.private_subnets
  database_subnets = var.database_subnets

  enable_nat_gateway = true
  enable_vpn_gateway = true
  enable_dns_support = true
  enable_dns_hostnames = true
  create_database_subnet_route_table = true
  create_database_nat_gateway_route = true
  create_database_internet_gateway_route = true
  
  create_database_subnet_group = true
  database_subnet_group_name = "${local.name}-database-subnet-group"
  tags = {
    Terraform = "true"
    Environment = "dev"
    public_subnet = "true"
    public_subnet_name = "public-subnet"
    private_subnet = "true"
    private_subnet_name = "private-subnet"
    database_subnet = "true"
    database_subnet_name = "database-subnet"
  }
}

