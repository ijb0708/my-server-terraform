locals {

    vm_dhcp_enabled = tonumber(substr(var.primary_key, 2, 1)) == 2 ? true : false // vmX0000
    
    vm_id   = tonumber(regex("[0-9]+", var.primary_key)) 
    vm_name = (
        local.vm_dhcp_enabled == true ? format("%s%s", var.role, random_string.short.result) : // dhcp
        local.vm_dhcp_enabled == false ? format("%s%03d", var.role, local.vm_ip_number) : // static ip
        "NONE"
    )

    // vm_category staic
    vm_subnet       = tonumber(substr(var.primary_key, 3, 1)) // vm0X000
    vm_ip_number    = tonumber(substr(var.primary_key, 4, 3)) // vm00XXX
    vm_domain       = (
        local.vm_subnet == 1 ? "${local.vm_name}.common.internal" : 
        local.vm_subnet == 2 ? "${local.vm_name}.cluster.internal" :
        ""
    ) 

    vm_static_ip           = format("10.1.%d.%d", local.vm_subnet, local.vm_ip_number)
    vm_static_address      = "${local.vm_static_ip}/24"
}
