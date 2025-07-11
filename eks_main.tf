resource "aws_eks_cluster" "viking" {
  name     = var.cluster_name
  count    = var.create_eks ? 1 : 0
  role_arn = aws_iam_role.eks_cluster_role.arn
  version  = "1.29"

  vpc_config {
    subnet_ids         = aws_subnet.vc_private[*].id
    security_group_ids = [aws_security_group.eks_sg.id]
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_policy
  ]
}

resource "aws_eks_node_group" "viking-node" {
  cluster_name    = aws_eks_cluster.viking[0].name
  count           = var.create_eks ? 1 : 0
  node_group_name = "${var.cluster_name}-ng"
  node_role_arn   = aws_iam_role.eks_node_group_role.arn
  subnet_ids      = aws_subnet.vc_public[*].id
  instance_types  = [var.node_instance_type]

  remote_access {
    ec2_ssh_key               = aws_key_pair.vikingcloud.key_name
    source_security_group_ids = [aws_security_group.ec2_sg.id]
  }

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_worker_node_policies
  ]
}


