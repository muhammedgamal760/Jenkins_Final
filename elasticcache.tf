resource "aws_elasticache_cluster" "jimmyredis" {
  cluster_id           = "jimmyredis"
  engine               = "redis"
  node_type            = "cache.t2.micro"
  num_cache_nodes      = 1
  engine_version       = "3.2.10"
  port                 = 6379
  security_group_ids = [aws_security_group.jimmyelasticcachesecuritygroup.id]
  subnet_group_name    = aws_elasticache_subnet_group.jimmyelasticcachesubnetgroup.name

}

resource "aws_security_group" "jimmyelasticcachesecuritygroup" {
  name        = "jimmyelasticcachesecuritygroup"
  description = "jimmyelasticcachesecuritygroup"
  vpc_id      = module.network.vpc_id

  ingress {
    description      = "port 6379"
    from_port        = 6379
    to_port          = 6379
    protocol         = "tcp"
    cidr_blocks      = [module.network.private_subnet_one.cidr_block,module.network.private_subnet_two.cidr_block]
  }
  depends_on = [
    module.network.private_subnet_one_id,
    module.network.private_subnet_two_id
  ]

  tags = {
    Name = "elasticcache"
  }
}

resource "aws_elasticache_subnet_group" "jimmyelasticcachesubnetgroup" {
  name       = "jimmyelasticcachesubnetgroup"
  subnet_ids = [module.network.private_subnet_one_id,module.network.private_subnet_two_id]
}

resource "aws_elasticache_user" "jimmyelasticcacheuser" {
  user_id       = "jimmyelasticcacheuser"
  user_name     = "jimmy"
  access_string = "on ~app::* -@all +@read +@hash +@bitmap +@geo -setbit -bitfield -hset -hsetnx -hmset -hincrby -hincrbyfloat -hdel -bitop -geoadd -georadius -georadiusbymember"
  engine        = "REDIS"
  passwords     = ["jimmyjimmyjimmyjimmyjimmy"]
}