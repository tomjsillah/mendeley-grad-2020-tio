locals {
  tags_list = [
    {
      "key"                 = "Name"
      "value"               = "user.eks_cluste"
      "propagate_at_launch" = false
    },
    {
      "key"                 = "Description"
      "value"               = "description"
      "propagate_at_launch" = false
    },
    {
      "key"                 = "Role"
      "value"               = "user"
      "propagate_at_launch" = false
    },
    {
      "key"                 = "ClusterName"
      "value"               = "eks_cluster"
      "propagate_at_launch" = false
    },
    {
      "key"                 = "kubernetes.io/cluster/eks_cluster"
      "value"               = "owned"
      "propagate_at_launch" = false
    }
  ]

  tags_map = {
    "Name"                              = "user.eks_cluster"
    "Description"                       = "description"
    "Role"                              = "user"
    "ClusterName"                       = "eks_cluster"
    "kubernetes.io/cluster/eks_cluster" = "owned"
  }
}

locals {
  eks_worker_node_userdata = <<USERDATA
#!/bin/bash -xe
set -o xtrace

/etc/eks/bootstrap.sh "eks_cluster"
USERDATA
}

locals {
  aws-auth-configmap = <<AWS_AUTH_CONFIGMAP

apiVersion: v1
kind: ConfigMap
metadata:
  name: aws-auth
  namespace: kube-system
data:
  mapRoles: |
    - rolearn: {aws_iam_role.eks_worker_node_role.arn}
      username: system:node:{{EC2PrivateDNSName}}
      groups:
        - system:bootstrappers
        - system:nodes
    - rolearn: arn:aws:iam::"AWS ACCOUNT ID:role/"AWS ROLE NAME"
      username: "AWS ROLE NAME":{{SessionName}}
      groups:
        - system:masters

AWS_AUTH_CONFIGMAP
}

locals {
  cluster_admin_kubeconfig_env_vars = <<CLUSTERADMIN_KUBECONFIG_ENV

      env:
        - name: AWS_PROFILE
          value: ""

CLUSTERADMIN_KUBECONFIG_ENV
}

locals {
  kubeconfig = <<KUBECONFIG

apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: ${aws_eks_cluster.eks_cluster.certificate_authority[0].data}
    server: https://5898EDB64752DA44F4A9511E108EC7CD.gr7.eu-west-2.eks.amazonaws.com
  name: eks_cluster
contexts:
- context:
    cluster: eks_cluster
    user: eks_cluster
  name: ""
current-context: eks_cluster
kind: Config
preferences: {}
users:
- name: eks_cluster
  user:
    exec:
      apiVersion: client.authentication.k8s.io/v1alpha1
      args:
      - token
      - -i
      - eks_cluster
      command: aws-iam-authenticator
      env:
      - name: AWS_PROFILE
        value: test
        

KUBECONFIG

}
