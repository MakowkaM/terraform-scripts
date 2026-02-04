variable "ami_id" {
  default = "ami-0c94855ba95c71c99"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "vpc_id" {
  default = "vpc-09609f6452bcca10d"
}

variable "subnet_ids" {
  default = ["subnet-064f6886bfcd3d46c", "subnet-07e13f2d7d1b7c17c"]
}

variable "ec2_sg_id" {
    default = "sg-07b080bcb331ede22"
}
variable "alb_sg_id" {
    default = "sg-07b080bcb331ede22"
}