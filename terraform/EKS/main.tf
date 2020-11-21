resource "aws_eks_cluster" "eks" {
  name     = "example"
  role_arn = var.arnrole

  vpc_config {
    subnet_ids       = [var.sub1, var.sub2]
    security_group_ids = [var.security_id]
  }
}

resource "aws_eks_node_group" "eks_node" {
  cluster_name    = "eks cluster node"
  node_group_name = "default"
  node_role_arn   = var.arnnode
  subnet_ids      = [var.sub1, var.sub2]
  instance_types  = var.instance_type
  ami_type        = var.ami_type

  scaling_config {
    desired_size = 2
    max_size     = 2
    min_size     = 2
  }
}
