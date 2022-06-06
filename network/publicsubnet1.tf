resource "aws_subnet" "jimmy_public_subnet_one" {
  vpc_id     = aws_vpc.jimmy_vpc.id
  cidr_block = var.public_subnet_one_cidr
  availability_zone = var.az1
  #cidr_block = "10.0.1.0/24"
  #availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "jimmy_public_subnet_one"
  }
}
