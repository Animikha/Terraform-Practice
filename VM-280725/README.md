## Project Overview

This project provisions a Virtual Machine (VM) with the following configurations:
1. Pre-installed Nginx web server
2. A simple static webpage hosted and served via Nginx
3. Firewall rules applied to allow specific traffic:
   - allow-ssh (for remote access)
   - allow-http (for web traffic)
   - allow-app (for port 8000)
   - allow-egress (to allow all outgoing traffic)

## Implementation Steps
Firewall Configuration
Created custom firewall rules in the default VPC to allow neccessary traffic example SSH, HTTP

## VM Creation
Launched a VM instance and applied the necessary network tags to associate it with the firewall rules

## Web Server Setup
Added a metadata_startup script in the VM to installe Nginx and deployed a basic HTML page to verify the setup
