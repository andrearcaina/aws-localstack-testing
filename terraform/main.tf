module "ec2" {
  source = "./modules/ec2"

  instance_name = var.ec2_instance_name
  instance_type = var.ec2_instance_type
  ami_id        = var.ec2_ami_id
}

module "eks" {
  source = "./modules/eks"

  enabled      = var.enable_eks
  cluster_name = var.eks_cluster_name
  role_arn     = var.eks_role_arn
  subnet_ids   = var.eks_subnet_ids
}
