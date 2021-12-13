output "myout" {
  value = aws_key_pair.ansible_key.id
}

output "ami" {
  value = data.aws_ami.centos7.id
}

output "public_ips" {
  value = aws_instance.node.*.public_ip
}

output "private_ips" {
  value = aws_instance.node.*.private_ip
}
