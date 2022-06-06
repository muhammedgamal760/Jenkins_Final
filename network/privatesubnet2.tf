resource "aws_subnet" "jimmy_private_subnet_two" {
  vpc_id     = aws_vpc.jimmy_vpc.id
  cidr_block = var.private_subnet_two_cidr
  availability_zone = var.az2
  #availability_zone = "us-east-1b"
  #cidr_block = "10.0.4.0/24"
  map_public_ip_on_launch = false
  tags = {
    Name = "jimmy_private_subnet_two"
  }
}
