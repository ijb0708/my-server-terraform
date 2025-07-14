locals {
  default_config = {
    cores       = 1
    sockets     = 1
    disk_size   = 4
    memory      = 2048
  }

  vms_config = {
    for key, cfg in local.vms_k3s : 
    key => merge(local.default_config, cfg)
  }
}

module "k3s_vms" {
    source   = "./module/k3s"
    for_each = local.vms_config

    primary_key   = each.key  
    role          = each.value.role

    sockets     = each.value.sockets
    cores       = each.value.cores
    memory      = each.value.memory
    disk_size   = each.value.disk_size
}