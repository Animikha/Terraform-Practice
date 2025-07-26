#!/bin/bash
exec > /var/log/startup-script.log 2>&1
set -x

sudo apt-get update
sudo apt-get install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx

echo "<h1> Terraform </h1>" | sudo tee /var/www/html/index.html