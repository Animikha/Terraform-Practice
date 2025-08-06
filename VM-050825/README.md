## 🖥️ VM Instances with for_each
This Terraform configuration creates multiple Google Cloud VM instances using a map variable called vm_instances. Each VM is defined with a name, machine type, and a startup script.

## What It Does
Provisions VMs in the europe-west2-a zone.
Uses Ubuntu 22.04 LTS as the base image.
Runs custom startup scripts on each VM.
Tags VMs to allow SSH, HTTP, and app traffic.
Outputs the public IPs of all created VMs.
How to Use
Update the vm_instances variable with your desired VM configurations. Each entry should include:

name
machine_type
startup_script (path to your shell script)
The resource block uses for_each to loop through the map and create a VM for each entry—making the setup scalable and easy to manage.
