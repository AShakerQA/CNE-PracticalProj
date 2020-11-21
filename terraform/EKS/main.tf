resource "aws_eks_cluster" "eks" {
  name     = "example"
  role_arn = "var.arnrole"

  vpc_config {
    subnet_ids       = [var.sub1, var.sub2]
    subnet_group_ids = [var.security_id]
  }

  resource "aws_eks_node_group" "eks_node" {
    cluster_name    = "eks cluster node"
    node_group_name = "default"
    node_role_arn   = var.arnnode
    subnet_ids      = [var.sub1, var.sub2]
    instance_types  = "t3.medium"
    ami_type        = "AL2_x86_64"

    scaling_config {
      desired_size = 2
      max_size     = 2
      min_size     = 2
    }

  }
}
