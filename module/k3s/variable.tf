variable "primary_key" {
    type        = string
    description = "important key for VMs, vm00000"
    
    validation {
        condition     = can(regex("^vm[0-9]{5}$", var.primary_key))
        error_message = "vm_name must be in the format 'vm' followed by exactly 5 digits (e.g., vm00001)."
    }
}

variable "vm_name" {
    type    = string
    default = ""
}

variable "role" {
    type    = string
    default = ""
}

variable "cores" {
    type        = number
    default     = 1 
    description = "Number of cores for the VMs"
}

variable "disk_size" {
    type = number
    description = "disk size for the VMs"

    default = 8
    validation {
        condition     = var.disk_size >= 4
        error_message = "vm_count 값은 반드시 8보다 커야 합니다."
    }
}

variable "sockets" {
    type        = number
    default     = 1 
    description = "Number of sockets for the VMs"
}

variable "memory" {
    type        = number
    default     = 2048
    description = "Number of memory size for the VMs"
}