# Define a map of VM instances
variable "vm_instances" {
  type = map(string)
  default = {
    "vm1" = "animikha-vm-0408251153-0"
    "vm2" = "animikha-vm-0408251153-1"
  }
}

# VM instance using for_each
resource "google_compute_instance" "my_vm" {
  for_each     = var.vm_instances
  name         = each.value

  machine_type = "e2-medium"
  zone         = "europe-west2-a"
  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
      size  = 10
      type  = "pd-standard"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  tags = ["allow-ssh", "allow-http", "allow-app", "allow-egress"]
  metadata_startup_script = file("install_nginx.sh")
}

# Output public IPs
output "vm_public_ips" {
  value       = [for vm in google_compute_instance.my_vm : vm.network_interface[0].access_config[0].nat_ip]
  description = "Public IPs of all VM instances"
}
