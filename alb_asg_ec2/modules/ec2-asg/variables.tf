variable "ami_id" {}
variable "instance_type" {}
variable "security_group_id" {}
variable "subnet_ids" {
    type = list(string)
}
variable "desired_capacity" {
    default = 2
}
variable "max_size" {
  default = 3
}
variable "min_size" {
  default = 1
}
variable "target_group_arns" {
  type = list(string)
}