locals {
  roles = ["master", "worker"]

  role_map = {
    for role in local.roles : role => {
      for k, v in module.k3s_vms : k => v if v.role == role
    }
  }
}

resource "local_file" "inventory" {

  content = templatefile("${path.module}/ansible/inventory.tmpl", {
    roles     = local.roles
    role_map  = local.role_map
  })

  filename ="${path.module}/ansible/inventory.ini"
}

# ansible-playbook -i inventory.ini playbooks/health-check.yml -f 1
# ansible-playbook -i inventory.ini playbooks/k3s-master.yml -f 1
# ansible-playbook -i inventory.ini playbooks/k3s-worker.yml -f 1
