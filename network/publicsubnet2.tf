resource "aws_subnet" "jimmy_public_subnet_two" {
  vpc_id     = aws_vpc.jimmy_vpc.id
  cidr_block = var.public_subnet_two_cidr
  availability_zone = var.az2
  #cidr_block = "10.0.3.0/24"
  #availability_zone = "us-east-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "jimmy_public_subnet_two"
  }
}
