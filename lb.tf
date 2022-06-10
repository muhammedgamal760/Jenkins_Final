resource "aws_lb" "jimmy-lb" {
  name               = "jimmy-lb"
  internal           = false
  load_balancer_type = "network"
  subnets            = [module.network.private_subnet_one_id]

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

resource "aws_lb_listener" "jimmy-listener" {
  load_balancer_arn = aws_lb.jimmy-lb.arn
  port              = "443"
  protocol          = "TLS"
  certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"
  alpn_policy       = "HTTP2Preferred"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.jimmy-target-group.arn
  }
}

resource "aws_lb_target_group_attachment" "jimmy-target-group-attachment" {
  target_group_arn = aws_lb_target_group.jimmy-target-group.arn
  target_id        = aws_instance.ec2b.id
  port             = 80
}