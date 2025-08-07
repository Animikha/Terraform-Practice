## 🖥️ VM Instances with `for_each`
This Terraform configuration creates multiple Google Cloud VM instances using a map variable called vm_instances. Each VM is defined with a different name, machine type, and a startup script.

## What It Does
- Provisions VMs in the europe-west2-a zone.
- Uses Ubuntu 22.04 LTS as the base image.
- Runs custom startup scripts on each VM.
- Tags VMs to allow SSH, HTTP, and app traffic.
- Outputs the public IPs of all created VMs.

## How to Use
Update the vm_instances variable with your desired VM configurations. Each entry should include:
- name
- machine_type
- startup_script (path to your shell script)

The resource block uses Terraform's `for_each` to iterate over the map and create a separate google_compute_instance for each VM. This makes the setup modular and scalable—just add or remove entries in the map to manage your VM fleet without changing the resource block itself.
