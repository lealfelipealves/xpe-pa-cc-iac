variable "region" {
  description = "Região AWS"
  type        = string
  default     = "us-east-1"
}

variable "assume_role" {
  description = "ARN da role para assumir"
  type = object({
    role_arn    = string
    external_id = string
  })
}

variable "tags" {
  description = "Tags para os recursos"
  type        = map(string)
}

variable "remote_backend" {
  description = "Nome do bucket S3 para o estado remoto do Terraform"
  type = object({
    bucket = string
  })
}
