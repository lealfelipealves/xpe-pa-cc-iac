resource "mgc_kubernetes_cluster" "this" {
  name                 = var.k8s_cluster.name
  version              = var.k8s_cluster.version
  description          = "Kubernetes cluster"
  enabled_server_group = true
}