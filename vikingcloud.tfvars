aws_region           = "ap-south-1"
vpc_cidr             = "10.0.0.0/16"
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.101.0/24", "10.0.102.0/24"]
availability_zones   = ["ap-south-1a", "ap-south-1b"]

# VikingCloud EC2

ami_id        = "ami-0f918f7e67a3323f0" # Example: Amazon Linux 2 AMI (ap-south-1)
instance_type = "t2.micro"

# EKS Cluster

cluster_name       = "vikingcloud-eks"
node_instance_type = "t3.medium"
create_eks         = false

## Setup
jenkins_instance_type = "t2.medium"
maven_instance_type   = "t2.micro"
docker_instance_type  = "t2.micro"
#jenkins_instance_type = "t2.medium"