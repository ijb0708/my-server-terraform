locals {
    vm_name         = var.vm_name != "" ? var.vm_name : format("vm%d", var.vm_id)

    vm_str_id       = tostring(var.vm_id)
    vm_subnet       = tonumber(substr(local.vm_str_id, 1, 1)) // 0X000
    vm_ip_number    = tonumber(substr(local.vm_str_id, 2, 3)) // 00XXX
    vm_domain       = (
        local.vm_subnet == 1 ? "${local.vm_name}.common.internal" : 
        local.vm_subnet == 2 ? "${local.vm_name}.kubernet.internal" :
        ""
    ) 

    vm_ip           = format("10.1.%d.%d", local.vm_subnet, local.vm_ip_number)
    vm_address      = "${local.vm_ip}/24"
}
