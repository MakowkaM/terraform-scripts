module "ec2_instance" {
    source = "../../modules/ec2"

    aws_region = var.aws_region
    ami_id = var.ami_id
    instance_type = var.instance_type
    vpc_id = var.vpc_id
    subnet_id = var.subnet_id
}