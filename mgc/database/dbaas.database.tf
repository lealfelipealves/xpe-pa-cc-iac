# resource "mgc_dbaas_instances" "this" {
#   name                  = var.dbaas.name
#   user                  = var.dbaas.user
#   password              = var.dbaas.password
#   engine_name           = var.dbaas.engine_name
#   engine_version        = var.dbaas.engine_version
#   instance_type         = var.dbaas.instance_type
#   volume_size           = var.dbaas.volume_size
#   backup_retention_days = var.dbaas.backup_retention_days
#   backup_start_at       = var.dbaas.backup_start_at

#   availability_zone = var.dbaas.availability_zone
#   parameter_group   = var.dbaas.parameter_group_name
# }

resource "mgc_dbaas_instances" "this" {
    availability_zone     = "br-se1-a"
    backup_retention_days = 5
    backup_start_at       = "04:00:00"
    engine_name           = "mysql"
    engine_version        = "8.4"
    instance_type         = "BV1-4-10"
    name                  = "xpe-pa-cc-dbaas"
    parameter_group       = "c56a8f79-d3da-4079-9d85-0dcc604ed038"
    password              = "Pa$$2qFiTgSIE1DuLe9Mcd"
    user                  = "xpepaccuser"
    volume_size           = 10
}