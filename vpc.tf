resource "aws_vpc" "my_vpc" {
  cidr_block = "192.168.0.0/16"
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "192.168.10.0/24"
  availability_zone = "eu-central-1b"
}
