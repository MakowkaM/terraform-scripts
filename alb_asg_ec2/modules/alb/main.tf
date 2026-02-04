resource "aws_alb" "alb" {
  name = "web-alb-22"
  load_balancer_type = "application"
  subnets = var.subnet_ids
  security_groups = [var.security_group_id]
}

resource "aws_lb_target_group" "tg" {
  name = "web-tg-22"
  port = 80
  protocol = "HTTP"
  vpc_id = var.vpc_id
  health_check {
    path = "/"
    protocol = "HTTP"
    healthy_threshold = 2
    unhealthy_threshold = 2
    interval = 30
    timeout = 5
  }
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_alb.alb.arn
  port = 80
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}