resource "aws_eks_cluster" "eks_cluster" {
  name     = "eks_cluster"
  role_arn = aws_iam_role.user.arn
vpc_config {
    security_group_ids      = [aws_security_group.grad20_SG.id, aws_security_group.https_grad20_SG.id]
    endpoint_private_access = false
    endpoint_public_access  = true
    subnet_ids = [aws_subnet.grad-public-1.id, aws_subnet.grad-public-2.id, aws_subnet.grad-private-1.id, aws_subnet.grad-private-2.id]
  }
  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.eks_cluster_AmazonEKSServicePolicy,
  ]
}