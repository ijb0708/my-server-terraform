variable "vms_k3s" {

  # vm_id       = string
  # role        = string
  
  # cores       = optional(number)
  # disk_size   = optional(number)
  # sockers     = optional(number)
  # memory      = optional(number)
  
  default = {
    master003 = { vm_id = 12003, role = "master", cores = 2 }
    worker011 = { vm_id = 12011, role = "worker" }
  }
}
