resource "aws_internet_gateway" "jimmy_igw" {
  vpc_id = aws_vpc.jimmy_vpc.id

  tags = {
    Name = "jimmy_igw"
  }
}