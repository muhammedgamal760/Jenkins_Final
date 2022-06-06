resource "aws_db_instance" "jimmy_rds" {
  allocated_storage    = 5
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  identifier           = "jimmy"
  username             = "jimmy"
  password             = "jimmyyyy"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.jimmy_rds_subnet_group.name
  vpc_security_group_ids = [aws_security_group.jimmy_rds_security_group.id]
  depends_on = [
    module.network.private_subnet_one_id,
    module.network.private_subnet_two_id
  ]
}
