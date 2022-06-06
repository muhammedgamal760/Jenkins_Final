resource "aws_route_table_association" "jimmy_public_route_association_one" {
  subnet_id      = aws_subnet.jimmy_public_subnet_one.id
  route_table_id = aws_route_table.jimmy_public_route_one.id
} 