output "instance_ids" {
  value = module.ec2_s3_dev.instance_ids_generated
}

output "instance_ips" {
  description = "Outputs the private IPs of the EC2 instances"
  value       = module.ec2_s3_dev.instance_ips_generated
}

output "buck-name" {
  description = "Outputs the name of the S3 bucket"
  value       = module.ec2_s3_dev.bucket_name_created
}



#output "website_url" {
#description = "Outputs the URL of the provisioned website"
#value = "https://${module.aws_infra.public_dns}:8080/index.html"
#}

