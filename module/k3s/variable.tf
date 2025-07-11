variable "vm_id" {
    type = number
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
        condition     = var.disk_size >= 8
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