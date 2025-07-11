output "vpc_id" {
  value = aws_vpc.vc.id
}

output "public_subnet_ids" {
  value = aws_subnet.vc_public[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.vc_private[*].id
}


output "cluster_name" {
  value = var.create_eks ? aws_eks_cluster.viking[0].name : ""
}


output "cluster_endpoint" {
  value = var.create_eks ? aws_eks_cluster.viking[0].endpoint : ""
}

output "kubeconfig_certificate_authority" {
  value = var.create_eks ? aws_eks_cluster.viking[0].certificate_authority[0].data : ""
}


output "eks_security_group_id" {
  value = aws_security_group.eks_sg.id
}

output "ec2_security_group_id" {
  value = aws_security_group.ec2_sg.id
}

output "jenkins_master" {
  value = aws_instance.jenkins_master.id
}

output "jenkins_agent" {
  value = aws_instance.jenkins_agent.id
}
output "docker_server" {
  value = aws_instance.docker_server.id
}

output "maven_server" {
  value = aws_instance.maven_server.id
}
