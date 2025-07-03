terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = ">= 0.78.0"
    }
  }
}

provider "proxmox" {
  endpoint = var.pm_api_url
  username = var.pm_user # 또는 API 전용 사용자
  password = var.pm_password
  insecure = true # 테스트용, 운영에서는 인증서 적용 권장
}
