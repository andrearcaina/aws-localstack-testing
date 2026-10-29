variable "enabled" {
  description = "Whether to create the EKS cluster."
  type        = bool
}

variable "cluster_name" {
  description = "Name of the EKS cluster."
  type        = string
}

variable "role_arn" {
  description = "IAM role ARN used by the EKS control plane."
  type        = string
}

variable "subnet_ids" {
  description = "Subnet IDs used by the EKS cluster."
  type        = list(string)
}
