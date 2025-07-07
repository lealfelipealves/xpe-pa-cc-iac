resource "mgc_virtual_machine_instances" "simple_vm" {
  name              = var.vm.name
  machine_type      = var.vm.machine_type
  image             = var.vm.image
  ssh_key_name      = var.vm.ssh_key_name
  availability_zone = var.vm.availability_zone
}

resource "mgc_network_public_ips" "vm_public_ip" {
  description = "Public IP for my VM"
  vpc_id      = var.vm.vpc_id
}

locals {
  primary_interface_id = [
    for interface in mgc_virtual_machine_instances.simple_vm.network_interfaces :
    interface.id if interface.primary
  ][0]
}

resource "mgc_network_public_ips_attach" "attach_to_default" {
  public_ip_id = mgc_network_public_ips.vm_public_ip.id
  interface_id = local.primary_interface_id
}

output "vm_public_ip" {
  value = mgc_network_public_ips.vm_public_ip.public_ip
}