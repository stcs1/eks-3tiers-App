locals {
  project = var.project_name
  environment = var.environment
  name = "${local.project}-${local.environment}"

  common_tags = {
    Project = local.project
    Environment = local.environment
  }
}

