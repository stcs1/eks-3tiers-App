#create VPC Terraform Module
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "6.6.1"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  database_subnets = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true
  enable_dns_support = true
  enable_dns_hostnames = true
#   create_database_subnet_route_table = true
#   create_database_nat_gateway_route = true
#   create_database_internet_gateway_route = true

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