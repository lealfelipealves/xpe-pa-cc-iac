variable "region" {
  description = "Região da Magalu Cloud"
  type        = string
  sensitive   = true
  nullable    = false

  default = "br-se1"
}

variable "api_key" {
  description = "Chave da Magalu Cloud"
  type        = string
  sensitive   = true
  nullable    = false
}

variable "access_key" {
  description = "ID da Chave do Object Storage"
  type        = string
  sensitive   = true
  nullable    = false
}

variable "secret_key" {
  description = "Secret da Chave do Object Storage"
  type        = string
  sensitive   = true
  nullable    = false
}

variable "bucket_name" {
  description = "Nome do Bucket"
  type        = string
  sensitive   = true
  nullable    = false
}