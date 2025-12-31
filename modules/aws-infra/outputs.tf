output "instance_ids" {
  description = "The IDs of the created EC2 instances"
  value       = aws_instance.webserver[*].id
}

output "instance_ips" {
  description = "The IP addresses of the created EC2 instances"
  value       = aws_instance.webserver[*].private_ip
}