# VM instance
resource google_compute_instance "my_vm" {
  count        = 2  # Change this number to the desired number of instances
  name         = "animikha-vm-3007251133-${count.index}"

  machine_type = "e2-medium"
  zone         = "europe-west2-a"
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
  metadata_startup_script = file("install_nginx.sh")
}

output "vm_public_ips" {
  value = [for instance in google_compute_instance.my_vm : instance.network_interface[0].access_config[0].nat_ip]
  description = "Public IPs of all VM instances"
}