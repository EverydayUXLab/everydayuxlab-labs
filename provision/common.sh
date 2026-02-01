#!/usr/bin/env bash
set -e

echo "=== Common setup ==="

sudo apt-get update -y || true
sudo yum update -y || true

# Basic tools
sudo apt-get install -y \
  curl wget git unzip htop ca-certificates || true

sudo yum install -y \
  curl wget git unzip htop ca-certificates || true

# Docker (used by almost all tools)
if ! command -v docker &> /dev/null; then
  curl -fsSL https://get.docker.com | sh
  sudo usermod -aG docker vagrant
fi

# Docker Compose
if ! command -v docker-compose &> /dev/null; then
  sudo curl -L "https://github.com/docker/compose/releases/download/v2.24.0/docker-compose-linux-x86_64" \
    -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
fi
