#!/bin/bash

set -e

# 현재 스크립트가 있는 디렉토리 기준으로 상위 디렉토리로 이동
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
cd "$PROJECT_ROOT"

# 고정된 리소스 타입
RESOURCE_TYPE="proxmox_virtual_environment_vm"
RESOURCE_NODE="galateia"

# 사용자 입력: 이름과 ID만 받기
RESOURCE_NAME="$1"
RESOURCE_ID="$2"

# 변수 파일 경로 (필요 시 수정 가능)
VARS_FILE="secrets.tfvars"

# 유효성 검사
if [[ -z "$RESOURCE_NAME" || -z "$RESOURCE_ID" ]]; then
  echo "Usage: $0 ${RESOURCE_NAME}  ${RESOURCE_ID}"
  # echo "Example: $0 myvm 105"
  exit 1
fi

echo "[1/3] Initializing Terraform..."
terraform init -upgrade

echo "[2/3] Importing: ${RESOURCE_TYPE}.${RESOURCE_NAME} with ID: virtual_environment/vm/$RESOURCE_NODE/$RESOURCE_ID"
terraform import -var-file="$VARS_FILE" "${RESOURCE_TYPE}.${RESOURCE_NAME}" "$RESOURCE_NODE/$RESOURCE_ID"

echo "[3/3] Running terraform plan..."
terraform plan -var-file="$VARS_FILE"

echo "Done. Review the plan output above."
