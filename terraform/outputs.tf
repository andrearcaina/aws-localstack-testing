output "ec2_instance_id" {
  description = "ID of the EC2 instance."
  value       = module.ec2.instance_id
}

output "eks_cluster_name" {
  description = "Name of the EKS cluster, when EKS is enabled."
  value       = module.eks.cluster_name
}

output "eks_cluster_endpoint" {
  description = "EKS API endpoint, when EKS is enabled."
  value       = module.eks.cluster_endpoint
}
