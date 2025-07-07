resource "proxmox_virtual_environment_vm" "router" {

  description = "Imported pfSense router VM"

  name      = "router"
  node_name = "galateia"
  vm_id     = 10001

  on_boot       = true
  scsi_hardware = "virtio-scsi-single"
  tags          = []

  cpu {
    cores   = 1
    sockets = 2
    type    = "host"
  }

  serial_device {
    device = "socket"
  }

  startup {
    down_delay = -1
    order      = 1
    up_delay   = -1
  }

  memory {
    dedicated = 4096
  }
  operating_system {
    type = "l26"
  }

  network_device {
    bridge      = "vmbr0"
    model       = "virtio"
    mac_address = "BC:24:11:09:34:95"
    firewall  = false
  }

  network_device {
    bridge      = "vmbr1"
    model       = "virtio"
    mac_address = "BC:24:11:C0:09:3F"
    firewall  = false
  }

}

resource "proxmox_virtual_environment_vm" "dhcp" {

  description = "Imported kea dhcp VM"

  name      = "dhcp"
  node_name = "galateia"
  vm_id     = 10002

  on_boot       = true
  scsi_hardware = "virtio-scsi-single"
  tags          = []

  cpu {
    cores      = 1
    flags      = []
    hotplugged = 0
    limit      = 0
    numa       = false
    sockets    = 1
    type       = "host"
    units      = 1024
  }

  memory {
    dedicated      = 1024
    floating       = 0
    keep_hugepages = false
    shared         = 0
  }

  operating_system {
    type = "l26"
  }

  network_device {
    bridge = "vmbr1"
    model  = "virtio"
    firewall  = false
  }
}

resource "proxmox_virtual_environment_vm" "dns" {

  description = "Imported local domain name server VM"

  name      = "dns"
  node_name = "galateia"
  vm_id     = 10003

  on_boot       = true
  scsi_hardware = "virtio-scsi-single"
  tags          = []

  cpu {
    cores      = 1
    flags      = []
    hotplugged = 0
    limit      = 0
    numa       = false
    sockets    = 1
    type       = "host"
    units      = 1024
  }

  memory {
    dedicated      = 1023
    floating       = 0
    keep_hugepages = false
    shared         = 0
  }

  operating_system {
    type = "l26"
  }

  network_device {
    bridge = "vmbr1"
    model  = "virtio"
    firewall  = false
  }
}

resource "proxmox_virtual_environment_vm" "ns" {

  description = "Imported local name server VM"

  name      = "ns"
  node_name = "galateia"
  vm_id     = 10005

  on_boot       = true
  scsi_hardware = "virtio-scsi-single"
  tags          = []

  cpu {
    cores      = 1
    sockets    = 2
    flags      = []
    hotplugged = 0
    limit      = 0
    numa       = false
    type       = "host"
    units      = 1024
  }

  memory {
    dedicated      = 4096
    floating       = 0
    keep_hugepages = false
    shared         = 0
  }

  operating_system {
    type = "l26"
  }

  network_device {
    bridge = "vmbr1"
    model  = "virtio"
    firewall  = false
  }

}

resource "proxmox_virtual_environment_vm" "codex" {

  description = "Imported data of infra VM"

  name      = "codex"
  node_name = "galateia"
  vm_id     = 10101

  on_boot       = true
  scsi_hardware = "virtio-scsi-single"
  tags          = []

  cpu {
    cores      = 1
    sockets    = 2
    flags      = []
    hotplugged = 0
    limit      = 0
    numa       = false
    type       = "host"
    units      = 1024
  }

  memory {
    dedicated      = 4096
    floating       = 0
    keep_hugepages = false
    shared         = 0
  }

  operating_system {
    type = "l26"
  }

  network_device {
    bridge = "vmbr1"
    model  = "virtio"
    firewall  = false
  }

  started = false
}

resource "proxmox_virtual_environment_vm" "daemon" {

  description = "Imported daemon of infra VM"

  name      = "daemon"
  node_name = "galateia"
  vm_id     = 10131

  on_boot       = true
  scsi_hardware = "virtio-scsi-single"
  tags          = []

  cpu {
    cores      = 1
    sockets    = 2
    flags      = []
    hotplugged = 0
    limit      = 0
    numa       = false
    type       = "host"
    units      = 1024
  }

  memory {
    dedicated      = 4096
    floating       = 0
    keep_hugepages = false
    shared         = 0
  }

  operating_system {
    type = "l26"
  }

  network_device {
    bridge = "vmbr1"
    model  = "virtio"
    firewall  = false
  }

  started = false
}