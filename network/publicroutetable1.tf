resource "aws_route_table" "jimmy_public_route_one" {
  vpc_id = aws_vpc.jimmy_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.jimmy_igw.id
  }
  tags = {
    Name = "jimmy_public_route_one"
  }
}