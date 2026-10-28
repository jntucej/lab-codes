#!/bin/bash
# VS Code one-click install for Ubuntu/Debian (official APT repo method)
# Usage: sudo bash vscode-install.sh

set -euo pipefail

echo "[1/4] Installing prerequisites..."
sudo apt update
sudo apt install -y wget gpg apt-transport-https

echo "[2/4] Importing Microsoft GPG key..."
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor -o /usr/share/keyrings/microsoft.gpg

echo "[3/4] Adding VS Code repository..."
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/code stable main" \
  | sudo tee /etc/apt/sources.list.d/vscode.list

echo "[4/4] Installing VS Code..."
sudo apt update
sudo apt install -y code

echo ""
echo "Done. Launch with: code"
# Alternative (Snap): sudo snap install --classic code
# Alternative (manual .deb): wget https://go.microsoft.com/fwlink/?linkid=851179 -O vscode.deb && sudo dpkg -i vscode.deb
