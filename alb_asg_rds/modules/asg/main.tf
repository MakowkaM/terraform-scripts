resource "aws_security_group" "ec2_sg" {
  vpc_id = var.vpc_id

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    security_groups = []
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_launch_template" "lt" {
  image_id = var.ami_id
  instance_type = var.instance_type

  network_interfaces {
    associate_public_ip_address = true
    security_groups = [aws_security_group.ec2_sg.id]
  }
}

resource "aws_autoscaling_group" "asg" {
  desired_capacity = 2
  max_size = 3
  min_size = 1
  vpc_zone_identifier = var.subnet_ids
  target_group_arns = [var.target_group_arn]

  launch_template {
    id = aws_launch_template.lt.id
    version = "$Latest"
  }
}