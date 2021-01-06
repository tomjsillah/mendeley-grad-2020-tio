resource "aws_eks_node_group" "nodegroup_a" {
  cluster_name    = "eks_cluster"
  node_group_name = "nodegroup_a"
  instance_types  = ["t2.micro"]
  ami_type        = "AL2_x86_64_GPU"
  disk_size       = "20"
  node_role_arn   = aws_iam_role.eks_worker_node_role.arn
  subnet_ids      = [aws_subnet.grad-private-1.id]

  scaling_config {
    desired_size = "2"
    max_size     = "3"
    min_size     = "1"
  }

  remote_access {
    ec2_ssh_key               = "re-cares"
    source_security_group_ids = [aws_security_group.eks_cluster_sg.id, aws_security_group.eks_worker_node_sg.id]
  }

  tags = {
    "kubernetes.io/cluster/eks_cluster" = "owned"
  }

  timeouts {
    create = "15m"
    update = "60m"
    delete = "15m"
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_worker_node_AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.eks_worker_node_AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.eks_worker_node_AmazonEC2ContainerRegistryReadOnly,
  ]
}

resource "aws_eks_node_group" "nodegroup_b" {
  cluster_name    = "eks_cluster"
  node_group_name = "nodegroup_b"
  instance_types  = ["t2.micro"]
  ami_type        = "AL2_x86_64_GPU"
  disk_size       = "20"
  node_role_arn   = aws_iam_role.eks_worker_node_role.arn
  subnet_ids      = [aws_subnet.grad-private-2.id]

  scaling_config {
    desired_size = "2"
    max_size     = "3"
    min_size     = "1"
  }

  remote_access {
    ec2_ssh_key               = "re-cares"
    source_security_group_ids = [aws_security_group.eks_cluster_sg.id, aws_security_group.eks_worker_node_sg.id]
  }

  tags = {
    "kubernetes.io/cluster/eks_cluster" = "owned"
  }

  timeouts {
    create = "15m"
    update = "60m"
    delete = "15m"
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_worker_node_AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.eks_worker_node_AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.eks_worker_node_AmazonEC2ContainerRegistryReadOnly,
  ]
}
