variable "web_sg_name" {
  default = "default_web_sg"
}

variable "sg_web_description" {
  default = "allow ssh connection"
}

variable "open_internet" {
  default = "0.0.0.0/0"
}

variable "ingress_ports" {
  description = "ingress ports"
  default = 22
}

variable "egress_ports" {
  description = "allow all egress"
  default = 0
}

variable "vpc_id" {
  description = "vpc id for sg"
}


