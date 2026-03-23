variable "cluster_name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "cidr" {
  type = string
}

variable "azs" {
  type = list(string)
}

variable "private_subnets" {
  type = list(string)
}

variable "public_subnets" {
  type = list(string)
}

variable "subnet_ids" {
  type = list(string)
}


variable "ami_type" {
  type = string
}

variable "instance_types" {
  type = string
}

