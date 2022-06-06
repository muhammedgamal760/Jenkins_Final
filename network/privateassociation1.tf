resource "aws_route_table_association" "jimmy_private_route_association_one" {
  subnet_id      = aws_subnet.jimmy_private_subnet_one.id
  route_table_id = aws_route_table.jimmy_private_route_one.id
} 