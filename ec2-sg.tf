module "public_bastion_sg" {
  source = "terraform-aws-modules/security-group/aws//modules/http-80"
    version = "~> 4.0"
    name        = "${var.project_name}-public-bastion-sg"
    description = "Security group for public bastion hosts for ssh access"
    vpc_id      = module.vpc.vpc_id

    ingress_rules = ["ssh-tcp"]
    ingress_cidr_blocks = ["10.0.0.0/0"]
    egress_rules = ["all-all"]
    
    tags = {
      Terraform = "true"
      Environment = var.environment
    }
}