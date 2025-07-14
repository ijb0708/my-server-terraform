#!/bin/bash

# 현재 스크립트가 있는 디렉토리 기준으로 상위 디렉토리로 이동
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")/ansible"

cd "$PROJECT_ROOT"

ansible-playbook playbooks/check.yml -f 1 -v

read -p "do you want to continue? (Y/n): " answer

if [[ "$answer" != "Y" && "$answer" != "y" ]]; then
  echo "canceled."
  exit 0
fi

# 실행할 명령어
echo "loading..."

ansible-playbook playbooks/k3s-master.yml -f 1 

echo "It's done"