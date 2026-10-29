variable "aws_region" {
  description = "AWS region used by LocalStack."
  type        = string
  default     = "us-east-1"
}

variable "ec2_instance_name" {
  description = "Name tag for the EC2 instance."
  type        = string
}

variable "ec2_instance_type" {
  description = "EC2 instance type."
  type        = string
  default     = "t2.micro"
}

variable "ec2_ami_id" {
  description = "AMI ID to use for the EC2 instance."
  type        = string
}

variable "enable_eks" {
  description = "Whether to create the EKS cluster."
  type        = bool
  default     = false
}

variable "eks_cluster_name" {
  description = "Name of the EKS cluster."
  type        = string
  default     = "localstack-eks"
}

variable "eks_role_arn" {
  description = "IAM role ARN used by the EKS control plane."
  type        = string
  default     = "arn:aws:iam::000000000000:role/localstack-eks-role"
}

variable "eks_subnet_ids" {
  description = "Subnet IDs used by the EKS cluster."
  type        = list(string)
  default     = []
}
