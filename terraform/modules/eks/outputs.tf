output "cluster_name" {
  description = "Name of the EKS cluster."
  value       = try(aws_eks_cluster.this[0].name, null)
}

output "cluster_endpoint" {
  description = "Endpoint of the EKS cluster."
  value       = try(aws_eks_cluster.this[0].endpoint, null)
}
