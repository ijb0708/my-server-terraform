resource "proxmox_virtual_environment_vm" "this" {

    vm_id         = local.vm_id
    name          = local.vm_name
    node_name     = "galateia"

    clone {
        vm_id       = 30001 // cloud init - debian template
        full        = true
    }

    cpu {
        cores       = var.cores
        sockets     = var.sockets
        type        = "host"  # recommended for modern CPUs
    }

    memory {
        dedicated   = var.memory
        floating    = var.memory # set equal to dedicated to enable ballooning
    }

    disk {
        datastore_id    = "vm-data"
        interface       = "scsi0"
        size            = var.disk_size
    }

    network_device {
        bridge      = "vmbr1"
        vlan_id     = 20
        model       = "virtio"
        firewall    = false
    }

    agent {
        enabled = true
        timeout = "15m"
        trim    = false
        type    = "virtio"
    }

    initialization {

        datastore_id = "vm-data"

        user_account {
            username = "servermanager"
            keys     = [trimspace(tls_private_key.vm_key.public_key_openssh)]
            password = random_password.vm_password.result
        }

        dns {
            domain = local.vm_domain
            servers = ["10.1.0.3"]
        }

        ip_config {
            dynamic "ipv4" {
                for_each = local.vm_dhcp_enabled ? [1] : []
                content {
                    address = "dhcp"
                }
            }

            dynamic "ipv4" {
                for_each = local.vm_dhcp_enabled ? [] : [1]
                content {
                    address = local.vm_static_address
                    gateway = "10.1.2.1"
                }
            }
            
        }

    }
}