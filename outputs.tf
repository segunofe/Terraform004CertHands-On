output "instance_ids" {
  value = module.aws_infra.instance_ids_generated
}

output "instance_ips" {
  description = "Outputs the private IPs of the EC2 instances"
  value       = module.aws_infra.instance_ips_generated
}



#output "website_url" {
#description = "Outputs the URL of the provisioned website"
#value = "https://${module.aws_infra.public_dns}:8080/index.html"
#}

