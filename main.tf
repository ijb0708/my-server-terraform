locals {

  # vm_id       = string
  # role        = string
  
  # sockets     = optional(number)
  # cores       = optional(number)
  # memory      = optional(number)
  # disk_size   = optional(number)
  
  vms_k3s = {
    vm12003 = { role = "master", sockets = 1, cores = 4, memory = 8192, disk_size=32 }

    vm22001 = { role = "worker", sockets = 1, cores = 1, memory = 2048, disk_size=16 }
    # worker012 = { vm_id = 12012, role = "worker", sockets = 1, cores = 2, memory = 2048, disk_size=16 }
  }

}