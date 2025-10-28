#!/bin/bash
# Playit installation script - Auto Installer Made by <3 Hopingboy
# Tested on Ubuntu/Debian

set -e

echo "=== Updating system ==="
sudo dnf update -y && sudo dnf upgrade -y

echo "=== Installing required dependencies ==="
sudo dnf install -y sudo curl gpg

echo "=== Adding Playit dnf repository ==="
curl -fsSL https://playit-cloud.github.io/ppa/key.gpg | \
  gpg --dearmor | sudo tee /etc/dnf/trusted.gpg.d/playit.gpg >/dev/null

echo "deb [signed-by=/etc/dnf/trusted.gpg.d/playit.gpg] https://playit-cloud.github.io/ppa/data ./" | \
  sudo tee /etc/dnf/sources.list.d/playit-cloud.list

echo "=== Updating package list ==="
sudo dnf update -y

echo "=== Installing Playit ==="
sudo dnf install -y playit

echo "=== Enabling Playit service ==="
sudo systemctl enable --now playit

echo "=== Running Playit setup ==="
playit setup

echo "✅ Playit installation complete!"
echo "➡️ Run 'playit status' to check the tunnel status."
