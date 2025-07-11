locals {
  roles = ["master", "worker"]
  role_map = {
    master = {
      for k, v in module.k3s_vms : k => v if v.role == "master"
    }
    worker = {
      for k, v in module.k3s_vms : k => v if v.role == "worker"
    }
  }
}

resource "local_file" "inventory_master" {
  content  = templatefile("${path.module}/ansible/inventory.tmpl", {
    vms_data = local.role_map["master"]
  })
  filename = "${path.module}/ansible/inventory/master.ini"
}

resource "local_file" "inventory_worker" {
  content  = templatefile("${path.module}/ansible/inventory.tmpl", {
    vms_data = local.role_map["worker"]
  })
  filename = "${path.module}/ansible/inventory/worker.ini"
}

# ansible-playbook -i inventory.ini playbooks/health-check.yml -f 1
# ansible-playbook -i inventory.ini playbooks/k3s-master.yml -f 1
# ansible-playbook -i inventory.ini playbooks/k3s-worker.yml -f 1
