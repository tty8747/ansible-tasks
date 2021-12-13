resource "aws_key_pair" "ansible-key" {
  key_name   = "ansible-key"
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
  count = length(var.instances)
  ami           = data.aws_ami.centos7.id
  instance_type = "t2.micro"

  tags = {
    Name = "${var.instances[count.index]}"
  }
}
