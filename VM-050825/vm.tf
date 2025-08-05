variable "vm_instances"{
  type = map(object({
    name = string
    machine_type = string
    startup_script = string
  }))

  default = {
    "vm1" = {
      name = "animikha-vm-0508251110-1"
      machine_type = "e2-medium"
      startup_script = "install_nginx1.sh"   
      },

      "vm2" = {
        name = "animikha-vm-0508251110-2"
        machine_type = "n2-standard-2"
        startup_script = "install_nginx2.sh"
      }
  }
}

resource "google_compute_instance" "my_vm"{
  for_each = var.vm_instances
  name = each.value.name
  machine_type = each.value.machine_type
  zone = "europe-west2-a"
  allow_stopping_for_update = true
  
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
      size = 10
      type = "pd-standard"
    }

}
  network_interface {
    network = "default"
    access_config {}
  }

  tags = ["allow-ssh", "allow-http", "allow-app", "allow-egress"]
  metadata_startup_script = file(each.value.startup_script)

}

# Output public IPs
output "vm_public_ips" {
  value       = [for vm in google_compute_instance.my_vm : vm.network_interface[0].access_config[0].nat_ip]
  description = "Public IPs of all VM instances"
}

