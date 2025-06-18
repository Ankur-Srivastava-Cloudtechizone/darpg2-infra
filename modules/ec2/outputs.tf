output "instance_ids" {
  value = { for k, inst in aws_instance.this : k => inst.id }
}

output "public_ips" {
  value = { for k, inst in aws_instance.this : k => inst.public_ip }
}
