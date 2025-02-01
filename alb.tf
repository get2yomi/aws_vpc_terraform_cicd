
resource "aws_lb" "app_load_balancer" {
  name               = "my-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.albserversecuritygroup.id]
  subnets            = [aws_subnet.public_app_a.id, aws_subnet.public_app_b.id]  # Ensure both are public

  enable_deletion_protection = false

  tags = {
    Name = "ApplicationLoadBalancer"
  }
}

resource "aws_lb_target_group" "alb_target_group" {
  name     = "alb-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.test.id
  target_type = "instance"
}

resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.app_load_balancer.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_target_group.arn
  }
}
