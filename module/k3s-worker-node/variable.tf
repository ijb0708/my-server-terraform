variable "vm_number" {
    type    = number
    description = "for ip address, key number"
}

variable "cores" {
    type        = number
    default     = 1 
    description = "Number of cores for the VMs"
}

variable "sockets" {
    type        = number
    default     = 1 
    description = "Number of sockets for the VMs"
}

variable "memory" {
    type        = number
    default     = 2048
    description = "Numver of memory size for the VMs"
}