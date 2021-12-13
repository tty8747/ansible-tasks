resource "aws_key_pair" "ansible_key" {
  key_name   = "ansible_key"
  public_key = file(var.path_to_mykey)
}

data "aws_ami" "centos7" {
  most_recent = true
  owners      = ["aws-marketplace"]

  filter {
    name   = "name"
    values = ["CentOS Linux 7*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "image-type"
    values = ["machine"]
  }
}

resource "aws_instance" "node" {
  count         = length(var.instances)
  ami           = data.aws_ami.centos7.id
  instance_type = "t2.micro"
  key_name      = aws_key_pair.ansible_key.id
  associate_public_ip_address = true
  subnet_id = aws_subnet.my_subnet.id
  vpc_security_group_ids = [aws_security_group.aws_sg.id]

  tags = {
    Name = var.instances[count.index]
  }
}
