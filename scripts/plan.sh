#!/bin/bash

set -e

# 현재 스크립트가 있는 디렉토리 기준으로 상위 디렉토리로 이동
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
cd "$PROJECT_ROOT"

# 변수 파일 경로 (필요 시 수정 가능)
VARS_FILE="secrets.tfvars"

echo "[1/2] Initializing Terraform at $PROJECT_ROOT ..."
terraform init -upgrade

echo "[2/2] Running terraform plan..."
terraform plan -var-file="$VARS_FILE"

echo "Done. Review the plan output above."
