resource "aws_vpc" "jimmy_vpc" {
  #cidr_block       = "10.0.0.0/16"
  cidr_block          = var.vpc_cidr
  tags = {
    #Name = "jimmy_vpc"
    Name = var.name
  }
  enable_dns_support = true
  enable_dns_hostnames = true

}
