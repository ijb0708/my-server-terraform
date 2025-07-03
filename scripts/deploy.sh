#!/bin/bash

# 현재 스크립트가 있는 디렉토리 기준으로 상위 디렉토리로 이동
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
cd "$PROJECT_ROOT"

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Variables
VARS_FILE="secrets.tfvars"
PLAN_FILE="plan.out"

echo -e "${YELLOW}[+] Running terraform plan...${NC}"

# Run init if needed
if [ ! -d ".terraform" ]; then
  echo -e "${YELLOW}[+] Running terraform init...${NC}"
  terraform init
fi

# Run plan
terraform plan -var-file="$VARS_FILE" -out="$PLAN_FILE"
if [ $? -ne 0 ]; then
  echo -e "${RED}[!] terraform plan failed. Exiting.${NC}"
  exit 1
fi

echo -e "${GREEN}[✓] Plan completed. Output saved to: ${PLAN_FILE}${NC}"

# Ask for confirmation
echo -ne "${YELLOW}[?] Do you want to apply these changes? (y/n): ${NC}"
read -r answer
if [[ "$answer" != "y" && "$answer" != "Y" ]]; then
  echo -e "${RED}[-] Apply cancelled. Exiting.${NC}"
  exit 0
fi

# Apply
echo -e "${GREEN}[+] Running terraform apply...${NC}"
terraform apply "$PLAN_FILE"

