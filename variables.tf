variable "aws_region" {
  type        = string
  description = "AWS region to deploy to region"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR block"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Comma-separated CIDRs for public subnets"
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "Comma-separated CIDRs for private subnets"
}

variable "availability_zones" {
  type        = list(string)
  description = "Comma-separated availability zones"
}

# EC2 

variable "ami_id" {
  type        = string
  description = "AMI ID for EC2 (Amazon Linux 2 or Ubuntu)"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}


# EKS
variable "cluster_name" {
  type        = string
  description = "Name of the EKS cluster"
}

variable "node_instance_type" {
  type    = string
  default = "t3.medium"
}
variable "create_eks" {
  description = "Toggle to create or skip EKS cluster"
  type        = bool
  default     = true
}

# variables.tf
variable "jenkins_instance_type" {
  description = "Instance type for Jenkins server"
  default     = "t2.medium"
}

variable "maven_instance_type" {
  description = "Instance type for maven server"
  default     = "t2.micro"
}

variable "docker_instance_type" {
  description = "Instance type for docker server"
  default     = "t2.micro"
}

#variable "jenkins_instance_type" {
#  description = "Instance type for Jenkins server"
#  type        = string
#}
