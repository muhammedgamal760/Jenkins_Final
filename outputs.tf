output "bastion_ip" {
   value = aws_instance.ec2a.public_ip
}
output "private_ip" {
   value = aws_instance.ec2b.private_ip
}
