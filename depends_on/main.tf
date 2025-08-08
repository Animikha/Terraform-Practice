resource "google_storage_bucket" "my_bucket" {
  name     = "animikha-gcs-0808251048"
  location = "US"
}

resource "google_compute_instance" "my_vm" {
  name         = "animikha-vm-0808251048"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  depends_on = [google_storage_bucket.my_bucket]
}

