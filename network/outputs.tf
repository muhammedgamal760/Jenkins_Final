output public_subnet_one_id {
  value       = aws_subnet.jimmy_public_subnet_one.id
}

output public_subnet_two_id {
  value       = aws_subnet.jimmy_public_subnet_two.id
}

output private_subnet_one_id {
  value       = aws_subnet.jimmy_private_subnet_one.id
}

output private_subnet_one {
  value       = aws_subnet.jimmy_private_subnet_one
}

output private_subnet_two {
  value       = aws_subnet.jimmy_private_subnet_two
}

output private_subnet_two_id {
  value       = aws_subnet.jimmy_private_subnet_two.id
}

output vpc_id {
  value       = aws_vpc.jimmy_vpc.id
}

output vpc_cidr {
  value       = aws_vpc.jimmy_vpc.cidr_block
}

output nat1 {
  value       = aws_nat_gateway.nat1.id
}

output jimmy_public_route_association_one {
    value = aws_route_table_association.jimmy_public_route_association_one.id
}





