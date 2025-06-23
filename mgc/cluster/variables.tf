variable "region" {
  type        = string
  description = "Região da Magalu Cloud"
  sensitive   = true
  nullable    = false

  default = "br-se1"
}

variable "api_key" {
  type        = string
  sensitive   = true
  description = "Chave da Magalu Cloud"
  nullable    = false
}

variable "access_key" {
  type        = string
  sensitive   = true
  description = "ID da Chave do Object Storage"
  nullable    = false
}

variable "secret_key" {
  type        = string
  sensitive   = true
  description = "Secret da Chave do Object Storage"
  nullable    = false
}

variable "k8s_cluster" {
  description = "Configuração da K8S Cluster"
  type = object({
    name           = string
    version        = string
    node_pool_name = string
    flavor_name    = string
    replicas       = number
    min_replicas   = number
    max_replicas   = number
    enabled_server_group = bool
  })

  default = {
    name           = "cluster"
    version        = "v1.32.3"
    node_pool_name = "cluster-node-pool"
    flavor_name    = "cloud-k8s.gp1.small"
    replicas       = 1
    min_replicas   = 0
    max_replicas   = 2
    enabled_server_group = true
  }
}