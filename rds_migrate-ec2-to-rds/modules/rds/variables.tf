variable "rds_vpc" {
  type = string
  default = "vpc-0a7282d335afbf4a0"
}

variable "ec2_sg" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
  default = ["subnet-0ba6e83626258b28e", "subnet-0ddb488281269df3c"]
}

variable "allocated_storage" {
  type = number
  }

variable "db_name" {
  type = string
}

variable "engine" {
  type = string
}

variable "engine_version" {
  type = string
}

variable "instance_class" {
  type = string
}

variable "username" {
  type = string
}

variable "password" {
  type = string
}