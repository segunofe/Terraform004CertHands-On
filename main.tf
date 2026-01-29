module "ec2_s3_dev" {
  source = "./modules/ec2_s3_infra"

  instance_count = var.parent_instance_count # Passing parent variable to child
  instance_name  = var.parent_instance_name  # Hands data from parent to child
  instance_type  = var.parent_instance_type

  bucket_name = var.parent_bucket_name
}


/*
module "ec2_stage" {
  source = "./modules/ec2"

  instance_count = var.parent_instance_count   # Passing parent variable to child
  instance_name  = var.parent_instance_name    # Hands data from parent to child
  instance_type  = var.parent_instance_type
}

module "ec2_prod" {
  source = "./modules/ec2"

  instance_count = var.parent_instance_count   # Passing parent variable to child
  instance_name  = var.parent_instance_name    # Hands data from parent to child
  instance_type  = var.parent_instance_type
}


#resource "aws_s3_bucket" "existing_bucket" {
  #bucket = "fair-buc-5657"
#}

*/

