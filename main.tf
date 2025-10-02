resource "aws_lb" "load_balancer" {
  name               = "${var.project_prefix}-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [data.aws_security_group.lb.id]
  subnets            = local.public_subnet_ids

  tags = local.common_tags
}

resource "aws_lb_target_group" "blue_tg" {
  name     = "${var.project_prefix}-blue-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.selected.id

  health_check {
    path = "/"
  }

  tags = local.common_tags
}

resource "aws_lb_target_group" "green_tg" {
  name     = "${var.project_prefix}-green-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.selected.id

  health_check {
    path = "/"
  }

  tags = local.common_tags
}

resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.load_balancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "forward"
    forward {
      target_group {
        arn    = aws_lb_target_group.blue_tg.arn
        weight = var.blue_weight
      }
      target_group {
        arn    = aws_lb_target_group.green_tg.arn
        weight = var.green_weight
      }
    }
  }
}

resource "aws_autoscaling_group" "blue_asg" {
  name                = "${var.project_prefix}-blue-asg"
  desired_capacity    = 2
  max_size            = 2
  min_size            = 2
  vpc_zone_identifier = local.public_subnet_ids
  target_group_arns   = [aws_lb_target_group.blue_tg.arn]

  launch_template {
    id      = aws_launch_template.blue_template.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "${var.project_prefix}-blue-instance"
    propagate_at_launch = true
  }
  tag {
    key                 = "Terraform"
    value               = "true"
    propagate_at_launch = true
  }
  tag {
    key                 = "Project"
    value               = var.project_prefix
    propagate_at_launch = true
  }
  tag {
    key                 = "Project"
    value               = var.project_prefix
    propagate_at_launch = true
  }
  tag {
    key                 = "Environment"
    value               = "Blue"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group" "green_asg" {
  name                = "${var.project_prefix}-green-asg"
  desired_capacity    = 2
  max_size            = 2
  min_size            = 2
  vpc_zone_identifier = local.public_subnet_ids
  target_group_arns   = [aws_lb_target_group.green_tg.arn]

  launch_template {
    id      = aws_launch_template.green_template.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "${var.project_prefix}-green-instance"
    propagate_at_launch = true
  }
  tag {
    key                 = "Terraform"
    value               = "true"
    propagate_at_launch = true
  }
  tag {
    key                 = "Project"
    value               = var.project_prefix
    propagate_at_launch = true
  }
  tag {
    key                 = "Environment"
    value               = "Greeen"
    propagate_at_launch = true
  }
}