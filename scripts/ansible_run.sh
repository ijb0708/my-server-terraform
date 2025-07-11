#!/bin/bash

# 현재 스크립트가 있는 디렉토리 기준으로 상위 디렉토리로 이동
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")/ansible"

# echo $SCRIPT_DIR
# echo $PROJECT_ROOT

cd "$PROJECT_ROOT"


# Playbook 선택
echo ""
echo "✅ Health check passed!"
echo "Choose which playbook to run:"
echo "1) k3s-master"
echo "2) k3s-worker"
echo "*) exit"
read -p "Enter your choice [1,2]: " choice

case $choice in
  1)
    ROLE="master"
    ;;
  2)
    ROLE="worker"
    ;;
  *)
    echo "❌ Invalid choice. Exiting."
    exit 1
    ;;
esac

# Health check
echo "Running health-check..."
ansible-playbook -i "inventory/${ROLE}.ini" playbooks/clean.yml -f 1
if [ $? -ne 0 ]; then
  echo "❌ Health check failed. Exiting."
  exit 1
fi

echo "Do you want run ${ROLE} playbook(Y/n)?"
read -r answer
if [[ "$answer" != "y" && "$answer" != "Y" ]]; then
  echo -e "cancelled"
  exit 0
fi

echo "▶ Running k3s-${ROLE} playbook..."
ansible-playbook -i "inventory/${ROLE}.ini" playbooks/k3s-master.yml -f 1
;;