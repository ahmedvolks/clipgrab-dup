#!/bin/bash
set -e
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://ahmedvolks.github.io/clipgrab-dup/KEY.gpg | sudo gpg --dearmor -o /etc/apt/keyrings/clipgrab-dup.gpg
echo "deb [signed-by=/etc/apt/keyrings/clipgrab-dup.gpg] https://ahmedvolks.github.io/clipgrab-dup stable main" | sudo tee /etc/apt/sources.list.d/clipgrab-dup.list
sudo apt clean
sudo apt update
sudo apt install -y clipgrab-dup
