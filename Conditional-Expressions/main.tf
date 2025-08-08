locals {
  vm_count = var.environment == "prod" ? 3 : 2
}

resource "google_compute_instance" "vm_instance" {
  count        = local.vm_count
  name         = "animikha-vm-0808251516-${count.index}"
  machine_type = "e2-medium"
  zone         = "europe-west2-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }
}
