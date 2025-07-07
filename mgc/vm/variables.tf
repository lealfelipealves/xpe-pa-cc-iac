variable "region" {
  type        = string
  description = "Região da Magalu Cloud"
  sensitive   = true

  default = "br-se1"
}

variable "api_key" {
  type        = string
  sensitive   = true
  description = "Chave da Magalu Cloud"
}

variable "access_key" {
  type        = string
  sensitive   = true
  description = "ID da Chave do Object Storage"
}

variable "secret_key" {
  type        = string
  sensitive   = true
  description = "Secret da Chave do Object Storage"
}

variable "vm" {
  description = "Configuração da VM"
  type = object({
    name              = string
    machine_type      = string
    image             = string
    ssh_key_name      = string
    availability_zone = string
    vpc_id            = string
  })

  default = {
    name              = "simple-vm"
    machine_type      = "BV1-1-10"
    image             = "cloud-ubuntu-24.04 LTS"
    ssh_key_name      = "your-ssh-key-name"
    availability_zone = "br-se1-a"
    vpc_id            = "vpc_default"
  }
}
