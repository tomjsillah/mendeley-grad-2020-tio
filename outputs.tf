output "iam_role_arn" {
  value = aws_iam_role.user.arn
}

output "kubeconfig" {
  value = local.kubeconfig
}

output "cluster_securitygroup_id" {
  value = aws_security_group.eks_cluster_sg.id
}

output "cluster_certificate_authority_data" {
  value = aws_eks_cluster.eks_cluster.certificate_authority[0].data
}

output "cluster_endpoint" {
  value = aws_eks_cluster.eks_cluster.endpoint
}

output "worker_node_securitygroup_id" {
  value = aws_security_group.eks_worker_node_sg.id
}

output "worker_node_role_arn" {
  value = aws_iam_role.eks_worker_node_role.arn
}

# output "worker_node_profile_name" {
#   value = aws_iam_instance_profile.eks_worker_node_profile.name
# }

output "worker_node_role_name" {
  value = aws_iam_role.eks_worker_node_role.name
}

output "tags_list" {
  value = local.tags_list
}

output "tags_map" {
  value = local.tags_map
}

output "worker_node_userdata" {
  value = local.eks_worker_node_userdata
}
