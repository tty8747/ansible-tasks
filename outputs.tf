output "myout" {
  value = aws_key_pair.ansible-key.id
}

output "ami" {
  value = data.aws_ami.centos7.id
}
