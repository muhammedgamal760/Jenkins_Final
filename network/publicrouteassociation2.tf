resource "aws_route_table_association" "jimmy_public_route_association_two" {
  subnet_id      = aws_subnet.jimmy_public_subnet_two.id
  route_table_id = aws_route_table.jimmy_public_route_one.id
} 