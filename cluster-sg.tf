resource "aws_security_group" "eks_cluster_sg" {
  name        = "cluster_sg"
  description = "Cluster communication with worker nodes"
  vpc_id      = aws_vpc.grad20.id

  tags = merge(
    {
      "Name"                              = "eks_cluster"
      "kubernetes.io/cluster/eks_cluster" = "owned"
    }
  )
}

resource "aws_security_group_rule" "eks_cluster_egress_all_traffic" {
  description       = "Allow all outbound traffic from EKS cluster"
  security_group_id = aws_security_group.eks_cluster_sg.id
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  type              = "egress"
}

resource "aws_security_group_rule" "eks_cluster_ingress_node_https" {
  description              = "Allow pods to communicate with the cluster API Server"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  security_group_id        = aws_security_group.eks_cluster_sg.id
  source_security_group_id = aws_security_group.eks_worker_node_sg.id
  type                     = "ingress"
}

resource "aws_security_group" "eks_worker_node_sg" {
  name        = "worker_node_sg"
  description = "Security group for all nodes in the cluster"
  vpc_id      = aws_vpc.grad20.id

  tags = merge(
    {
      "Name"                              = "eks_cluster"
      "kubernetes.io/cluster/eks_cluster" = "owned"
    }
  )
}

resource "aws_security_group_rule" "eks_worker_node_egress_all_traffic" {
  description       = "Allow all outbound traffic from worker nodes"
  security_group_id = aws_security_group.eks_worker_node_sg.id
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  type              = "egress"
}

resource "aws_security_group_rule" "control_plane_ingress_cluster" {
  description              = "Allow worker Kubelets and pods to receive communication from the cluster control plane"
  from_port                = 1025
  protocol                 = "tcp"
  security_group_id        = aws_security_group.eks_worker_node_sg.id
  source_security_group_id = aws_security_group.eks_cluster_sg.id
  to_port                  = 65535
  type                     = "ingress"
}

resource "aws_security_group_rule" "eks_worker_node_ingress_https" {
  description              = "Allow worker Kubelets and pods to receive https communication from the cluster control plane"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  security_group_id        = aws_security_group.eks_worker_node_sg.id
  source_security_group_id = aws_security_group.eks_cluster_sg.id
  type                     = "ingress"
}

resource "aws_security_group_rule" "eks_worker_node_ingress_self" {
  description              = "Allow access from itself"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.eks_worker_node_sg.id
  source_security_group_id = aws_security_group.eks_worker_node_sg.id
  type                     = "ingress"
}
