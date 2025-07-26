# VPC and Security Group
data "google_compute_network" "default" {
  name = "default"

}

resource "google_compute_firewall" "allow_ingress_ssh" {   
    name = "allow-ingress-ssh"
    network = data.google_compute_network.default.name
    
    direction = "INGRESS"
    allow {
        protocol = "tcp"
        ports = ["22"]
    }

    source_ranges = ["0.0.0.0/0"]
     target_tags = ["allow-ssh"]

}

resource "google_compute_firewall" "allow_ingress_http" {   
    name = "allow-ingress-http"
    network = data.google_compute_network.default.name
    
    direction = "INGRESS"
    allow {
        protocol = "tcp"
        ports = ["80"]
    }

    source_ranges = ["0.0.0.0/0"]
    target_tags = ["allow-http"]

}

resource "google_compute_firewall" "allow_ingress_app" {   
    name = "allow-ingress-app"
    network = data.google_compute_network.default.name
    
    direction = "INGRESS"
    allow {
        protocol = "tcp"
        ports = ["8000"]
    }

    source_ranges = ["0.0.0.0/0"]
    target_tags = ["allow-app"]

}

resource "google_compute_firewall" "allow_egress" {   
    name = "allow-egress"
    network = data.google_compute_network.default.name
    
    direction = "EGRESS"
    allow {
        protocol = "all"
    }

    destination_ranges = ["0.0.0.0/0"]
    target_tags = ["allow-egress"]

}

# VM instance
resource google_compute_instance "my_vm" {
  name         = "animikha-vm-2407251539"
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
    network = data.google_compute_network.default.name
    access_config {}
  }

  tags = ["allow-ssh", "allow-http", "allow-app", "allow-egress"]

  metadata_startup_script = file("install_nginx.sh")
}