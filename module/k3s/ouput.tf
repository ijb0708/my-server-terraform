output "primary_key" {
    value = var.primary_key
    sensitive = false
}

output "vm_username" {
  value     = "servermanager"
  sensitive = false
}

output "vm_password" {
  value     = random_password.vm_password.result
  sensitive = true
}

output "role" {
  value     = var.role
  sensitive = false
}

output "vm_ip" {
  # value     =  local.vm_ip
  value     = proxmox_virtual_environment_vm.this.ipv4_addresses[1][0]
  sensitive = false
}

output "vm_name" {
  value     = proxmox_virtual_environment_vm.this.name
  sensitive = false
}

output "vm_private_key" {
  value     = tls_private_key.vm_key.private_key_pem
  sensitive = true
}

output "vm_public_key" {
  value = tls_private_key.vm_key.public_key_openssh
  sensitive = true
}

output "vm_id" {
    value = proxmox_virtual_environment_vm.this.vm_id
    sensitive = false
}