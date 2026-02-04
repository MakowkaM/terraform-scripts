resource "aws_launch_template" "lt" {
  name_prefix = "web-server-22"
  image_id = var.ami_id
  instance_type = var.instance_type

  network_interfaces {
    associate_public_ip_address = true
    security_groups = [var.security_group_id]
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "asg" {
  desired_capacity = var.desired_capacity
  max_size = var.max_size
  min_size = var.min_size
  vpc_zone_identifier = var.subnet_ids
  launch_template {
    id = aws_launch_template.lt.id
  }

  target_group_arns = var.target_group_arns

  tag {
    key = "Name"
    value = "Terraform-ASG-Instance22"
    propagate_at_launch = true
  }
}