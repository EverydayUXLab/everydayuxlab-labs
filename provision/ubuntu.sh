#!/usr/bin/env bash
set -e

echo "=== Ubuntu setup ==="

sudo apt-get update -y

# Python stack (Airflow / MLflow)
sudo apt-get install -y \
  python3 python3-pip python3-venv

pip3 install --upgrade pip
