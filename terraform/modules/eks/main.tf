resource "aws_eks_cluster" "this" {
  count = var.enabled ? 1 : 0

  name     = var.cluster_name
  role_arn = var.role_arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }
}
