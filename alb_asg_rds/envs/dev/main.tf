module "vpc" {
  source = "../../modules/vpc"
  cidr_block = "10.0.0.0/16"
  public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.201.0/24", "10.0.202.0/24"]
  azs = ["us-east-1a", "us-east-1b"]
}

module "alb" {
  source = "../../modules/alb"
  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.public_subnet_ids
}

module "asg" {
  source = "../../modules/asg"
  subnet_ids = module.vpc.public_subnet_ids
  target_group_arn = module.alb.tg_arn
  vpc_id = module.vpc.vpc_id
  ami_id = var.ami_id
  instance_type = "t3.micro"
}

module "rds" {
  source = "../../modules/rds"
  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnet_ids
}