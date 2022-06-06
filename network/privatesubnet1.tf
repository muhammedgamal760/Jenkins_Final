resource "aws_subnet" "jimmy_private_subnet_one" {
  vpc_id     = aws_vpc.jimmy_vpc.id
  cidr_block = var.private_subnet_one_cidr
  availability_zone = var.az1
  #cidr_block = "10.0.2.0/24"
  #availability_zone = "us-east-1a"
  map_public_ip_on_launch = false
  tags = {
    Name = "jimmy_private_subnet_one"
  }
}
