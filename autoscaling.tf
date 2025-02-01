resource "aws_autoscaling_group" "web_asg" {
  vpc_zone_identifier = [aws_subnet.priv_app_cidr_block_a.id, aws_subnet.priv_app_cidr_block_b.id]# Private subnets
  desired_capacity    = 2
  min_size           = 2
  max_size           = 5

  launch_template {
    id      = aws_launch_template.web_launch_template.id
    version = aws_launch_template.web_launch_template.latest_version
  }

  target_group_arns = [aws_lb_target_group.alb_target_group.arn]

  tag {
    key                 = "Name"
    value               = "AutoScaledInstance"
    propagate_at_launch = true
  }
  depends_on = [aws_subnet.priv_app_cidr_block_a, aws_subnet.priv_app_cidr_block_b]# Private subnets
}

# creating auto scalling policies
resource "aws_autoscaling_policy" "scale_out" {
  name                   = "scale-out"
  autoscaling_group_name = aws_autoscaling_group.web_asg.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = 1
  cooldown              = 300
}

resource "aws_autoscaling_policy" "scale_in" {
  name                   = "scale-in"
  autoscaling_group_name = aws_autoscaling_group.web_asg.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = -1
  cooldown              = 300
}

