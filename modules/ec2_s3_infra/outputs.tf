output "instance_ids_generated" {
  description = "The IDs of the created EC2 instances"
  value       = aws_instance.server_name[*].id
}

output "instance_ips_generated" {
  description = "The IP addresses of the created EC2 instances"
  value       = aws_instance.server_name[*].private_ip
}

output "bucket_name_created" {
  description = "The IP addresses of the created EC2 instances"
  value       = aws_s3_bucket.example.id
}