variable "instance" {
  description = "EC2 image"
  default = "t2.micro"
}

variable "ami_id" {
  default = "ami-0dc8d444ee2a42d8a"
}

variable "subnet_id" {
  description = "subnet id for EC2"
}

variable "name" {
  description = "EC2 name"
}

variable "enable_public_ip" {
  description = "enable public ip"
  default = true
}

variable "vpc_security_group_ids" {
  description = "vpc security group ids"
}

