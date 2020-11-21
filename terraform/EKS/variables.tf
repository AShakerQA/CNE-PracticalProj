variable "sub1" {
  description = "subnet id from vpc"
}

variable "sub2" {
  description = "subnet id from vpc"
}

variable "security_id" {
  description = "security group id"
}

variable "arnroles"{
  default = "arn:aws:iam::973553080645:role/cluster_role"
}

variable "arnnode" {
  default = "arn:aws:iam::973553080645:role/aws-service-role/eks-nodegroup.amazonaws.com/AWSServiceRoleForAmazonEKSNodegroup"
}
