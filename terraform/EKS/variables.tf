variable "sub1" {
  description = "subnet id from vpc"
}

variable "sub2" {
  description = "subnet id from vpc"
}

variable "security_id" {
  description = "security group id"
}

variable "arnrole" {
  default = "arn:aws:iam::973553080645:role/cluster_role"
}

variable "arnnode" {
  default = "arn:aws:iam::973553080645:role/NodeInstanceRole"
}

variable "instance_type" {
  default = ["t3.medium"]
}

variable "ami_type" {
  default = "AL2_x86_64"
}
