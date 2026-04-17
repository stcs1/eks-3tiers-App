variable "project_name" {}
variable "environment" {}
variable "vpc_name" {}
variable "vpc_cidr" {}
variable "azs" {
  type = list(string)
  default = ["us-east-1a", "us-east-1b"]
}
variable "private_subnets" {
  type = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}
variable "public_subnets" {
    type = list(string)
    default = ["10.0.101.0/24", "10.0.102.0/24"]
}
variable "database_subnets" {
    type = list(string)
    default = ["10.0.201.0/24", "10.0.202.0/24"]
}

variable "instance_type" {
  description = "aws-ec2-instance type"
  type = string
  default = "t3.micro"
}

variable "instance_keypair" {
  description = "aws ec2 keypair associated with the ec2 instance"
  type = string
  default = "eks-key-pair"
}




