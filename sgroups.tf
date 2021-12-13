resource "aws_security_group" "aws_sg" {
  name        = "mysg"
  description = "Allow all"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    from_port        = "0"
    to_port          = "0"
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = "0"
    to_port          = "0"
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}
