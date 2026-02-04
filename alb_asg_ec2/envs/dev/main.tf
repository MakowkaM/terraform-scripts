module "alb" {
    source = "../../modules/alb"
    subnet_ids = var.subnet_ids
    security_group_id = var.alb_sg_id
    vpc_id = var.vpc_id
}

module "ec2_asg" {
  source = "../../modules/ec2-asg"
  ami_id = var.ami_id
  instance_type = var.instance_type
  security_group_id = var.ec2_sg_id
  subnet_ids = var.subnet_ids
  desired_capacity = 2
  min_size = 1
  max_size = 3
  target_group_arns = [module.alb.target_group_arn]
}