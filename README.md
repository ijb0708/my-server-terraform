# Terraform Configuration for My Home Server

This repository contains Terraform files based on the structure of my personal home server environment.  
The code is currently under active maintenance and ongoing development.

Please refer to the code for further technical details.


Scripts available in the `./scripts/` directory:
- ansible_run.sh # Executes Ansible playbooks
- plan.sh # Runs terraform plan
- deploy.sh # Applies the Terraform configuration
- import.sh # Imports existing Proxmox VM into Terraform state

### 🔁 Importing Existing Proxmox VMs

To import an existing Proxmox VM into Terraform state:

```bash
./scripts/import.sh <resource_name> <vm_id>
```

For example:
```bash
./scripts/import.sh router 12001
```

---

## 🖥️ Server Architecture

| Role        | IP Address | Description     |
|-------------|------------|-----------------|
| Router      | 10.1.0.1   | pfSense         |
| DHCP Server | 10.1.0.2   | Kea DHCP        |
| DNS Server  | 10.1.0.3   | AdGuard Home    |
| NS Server   | 10.1.0.5   | PowerDNS        |

### Kubernetes (K3s)

| Node Type     | IP Range         | Description     |
|---------------|------------------|-----------------|
| Master Nodes  | 10.1.2.2 ~ 10.1.2.9   | Control Plane   |
| Worker Nodes  | 10.1.2.11 ~ 10.1.2.20 | Compute Nodes   |

---

## ⚙️ Environment Information

- **Proxmox VE**: 8.3.4  
- **Guest OS**: Debian 12.11.0 (for VMs)

---

## 🔧 Tools and Providers

- **Terraform**: 1.12.2  
- **Terraform Provider**: `bpg/proxmox` v0.78.0  
- **Ansible**: 2.18.6
