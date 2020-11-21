resource "aws_eks_cluster" "eks" {
  name     = "example"
  role_arn = "arn:aws:iam::973553080645:role/cluster_role"

  vpc_config {
    subnet_ids       = [var.sub1, var.sub2]
    subnet_group_ids = [var.security_id]
  }
}

