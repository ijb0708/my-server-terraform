output "k3s" {
  value     = {
    for name, data in module.k3s_vms :
    name => {
        id          = data.vm_id
        ip          = data.vm_ip
        username    = "servermanager"
        # password    = data.vm_password
        # private_key = data.vm_private_key
        public_key  = data.vm_public_key
    } 
  }
  sensitive = true
}