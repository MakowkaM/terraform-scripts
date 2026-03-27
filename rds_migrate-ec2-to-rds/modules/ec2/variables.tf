variable "ami_id" {
  type = string
  default = "ami-02dfbd4ff395f2a1b"
}

variable "instance_type" {
  type = string
  default = "t3.medium"
}

variable "subnet_id" {
  type = string
  default = "subnet-0ba6e83626258b28e"
}

variable "vpc_id" {
  type = string
  default = "vpc-0a7282d335afbf4a0"
}