resource "aws_lb" "jimmy-lb" {
  name               = "jimmy-lb"
  internal           = false
  load_balancer_type = "network"
  subnets            = ["jimmy_private_subnet_one.id"]

  enable_deletion_protection = true

  tags = {
    Environment = "production"
  }
}

resource "aws_lb_target_group" "jimmy-target-group" {
  name     = "jimmy-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.network.vpc_id
}

resource "aws_lb_target_group_attachment" "jimmy-target-group-attachment" {
  target_group_arn = aws_lb_target_group.jimmy-target-group.arn
  target_id        = aws_instance.ec2b.id
  port             = 80
}