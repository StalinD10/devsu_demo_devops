resource "helm_release" "metrics_server" {
  name = "metrics-server"

  repository = "https://kubernetes-sigs.github.io/metrics-server/"
  chart      = "metrics-server"
  namespace  = "kube-system"

  values = [file("${path.module}/values/metrics.yaml")]

  depends_on = [aws_eks_node_group.node_eks_demo]
}