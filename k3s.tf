locals {
  default_config = {
    cores       = 1
    sockets     = 1
    disk_size   = 8
    memory      = 2048
  }
  vms_config = {
    for name, cfg in var.vms_k3s :
    name => merge(local.default_config, cfg)
  }
}

module "k3s_vms" {
    source   = "./module/k3s"
    for_each = local.vms_config

    vm_name = each.key
    vm_id   = each.value.vm_id
    role    =  each.value.role

    cores       = each.value.cores
    disk_size   = each.value.disk_size
    sockets     = each.value.sockets
    memory      = each.value.memory
}