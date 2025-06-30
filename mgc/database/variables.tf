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

variable "dbaas" {
  description = "Configuração da DBaaS"
  type = object({
    name                  = string
    user                  = string
    password              = string
    engine_id             = string
    engine_name           = string
    engine_version        = string
    instance_type         = string
    volume_size           = number
    backup_retention_days = number
    backup_start_at       = string
    availability_zone     = string
    parameter_group_id    = string
    parameter_group_name  = string
  })

  default = {
    name                  = "dbaas"
    user                  = "user"
    password              = "password"
    engine_id             = "e1db7c95-83bf-40c4-aaee-9e1d35659a0a"
    engine_name           = "mysql"
    engine_version        = "8.4"
    instance_type         = "db.i1-c1-r4-d10"
    volume_size           = 10
    backup_retention_days = 5
    backup_start_at       = "04:00:00"
    availability_zone     = "br-se1-a"
    parameter_group_id    = "c56a8f79-d3da-4079-9d85-0dcc604ed038"
    parameter_group_name  = "mysql84-dbaas.default"
  }
}

