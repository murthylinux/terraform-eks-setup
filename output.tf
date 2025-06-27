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
  value = aws_eks_cluster.viking.name
}

output "cluster_endpoint" {
  value = aws_eks_cluster.viking.endpoint
}

output "kubeconfig_certificate_authority" {
  value = aws_eks_cluster.viking.certificate_authority[0].data
}

output "eks_security_group_id" {
  value = aws_security_group.eks_sg.id
}

output "ec2_security_group_id" {
  value = aws_security_group.ec2_sg.id
}
