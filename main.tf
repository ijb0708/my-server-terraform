variable "vms_k3s" {

  # vm_id       = string
  # role        = string
  
  # sockets     = optional(number)
  # cores       = optional(number)
  # memory      = optional(number)
  # disk_size   = optional(number)
  
  default = {
    master003 = { vm_id = 12003, role = "master", sockets = 1, cores = 4, memory = 8192, disk_size=32 }
    # worker011 = { vm_id = 12011, role = "worker" }
  }
}
