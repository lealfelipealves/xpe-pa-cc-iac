resource "mgc_kubernetes_nodepool" "this" {
  name        = var.k8s_cluster.node_pool_name
  cluster_id  = mgc_kubernetes_cluster.this.id
  flavor_name = var.k8s_cluster.flavor_name
  replicas     = var.k8s_cluster.replicas
  min_replicas = var.k8s_cluster.min_replicas
  max_replicas = var.k8s_cluster.max_replicas
}