module "aws_infra" {
  source = "./modules/aws-infra"

  instance_count = var.parent_instance_count   # Passing parent variable to child
  instance_name  = var.parent_instance_name    # Hands data from parent to child
  instance_type  = var.parent_instance_type
}



