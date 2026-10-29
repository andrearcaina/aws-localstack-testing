variable "instance_name" {
  description = "Name tag for the instance."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the instance."
  type        = string
}
