
output "eks_cluster" {
  description = "Details of the EKS cluster"
  value = {
    name           = aws_eks_cluster.eks.name
    endpoint       = aws_eks_cluster.eks.endpoint
    arn            = aws_eks_cluster.eks.arn
    version        = aws_eks_cluster.eks.version
    vpc_id         = aws_eks_cluster.eks.vpc_config[0].vpc_id
    security_group = aws_eks_cluster.eks.vpc_config[0].cluster_security_group_id
  }
}

output "iam_roles" {
  description = "ARNs of key IAM roles"
  value = {
    cluster_role         = aws_iam_role.eks.arn
    nodes_role           = aws_iam_role.nodes.arn
    autoscaler_role      = aws_iam_role.cluster_autoscaler.arn
    load_balancer_role   = aws_iam_role.aws_lbc.arn
  }
  sensitive = true
}

output "node_group" {
  description = "Node group details"
  value = {
    name          = aws_eks_node_group.node_eks_demo.node_group_name
    status        = aws_eks_node_group.node_eks_demo.status
    instance_type = aws_eks_node_group.node_eks_demo.instance_types[0]
    desired_size  = aws_eks_node_group.node_eks_demo.scaling_config[0].desired_size
    max_size      = aws_eks_node_group.node_eks_demo.scaling_config[0].max_size
    min_size      = aws_eks_node_group.node_eks_demo.scaling_config[0].min_size
  }
}

output "vpc" {
  description = "VPC details"
  value = {
    id         = aws_vpc.main.id
    cidr_block = aws_vpc.main.cidr_block
    igw_id     = aws_internet_gateway.igw.id
  }
}

output "addons" {
  description = "Status of installed add-ons"
  value = {
    cluster_autoscaler_version = helm_release.cluster_autoscaler.version
    aws_lbc_version           = helm_release.aws_lbc.version
    pod_identity_associations = {
      autoscaler = aws_eks_pod_identity_association.cluster_autoscaler.id
      aws_lbc    = aws_eks_pod_identity_association.aws_lbc.id
    }
  }
}

output "kubeconfig_command" {
  description = "Command to configure kubectl"
  value       = "aws eks --region ${var.region} update-kubeconfig --name ${aws_eks_cluster.eks.name}"
}

output "autoscaler_deployment_status" {
  description = "Command to check Cluster Autoscaler deployment"
  value       = "kubectl get deployment -n kube-system cluster-autoscaler"
}

output "load_balancer_controller_status" {
  description = "Command to check AWS Load Balancer Controller"
  value       = "kubectl get pods -n kube-system -l app.kubernetes.io/name=aws-load-balancer-controller"
}

output "cluster_certificate" {
  description = "Cluster certificate data (for kubectl)"
  value       = aws_eks_cluster.eks.certificate_authority[0].data
  sensitive   = true
}