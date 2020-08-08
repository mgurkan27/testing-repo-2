output "instance_ip_addr" {
  value = aws_instance.example.private_ip
}

output "instance_public_ip" {
    value = aws_instance.example.public_ip
}