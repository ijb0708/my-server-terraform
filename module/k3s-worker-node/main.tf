terraform {
    required_providers {
        proxmox = {
            source  = "bpg/proxmox"
            version = "= 0.78.0"
        }
    }
}

resource "proxmox_virtual_environment_vm" "this" {

    name          = "vm-from-template"
    vm_id         = 9002
    node_name     = "galateia"

    clone {
        vm_id       = 30001
        full        = true
    }

}