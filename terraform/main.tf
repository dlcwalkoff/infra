provider "google" {
    project = "my-otus"
    region = "europe-west1"
}

resource "google_compute_instance" "app" {
    name = "reddit-app"
    machine_type = "g1-small"
    zone = "europe-west1-b"
    tags = ["reddit-app"]

    metadata {
        sshKeys = "appuser:${"~/.ssh/appuser.pub"}"
    }

    boot_disk {
        initialize_params {
            image = "reddit-base-1505035847"
        }
    }

    network_interface {
        network = "default"
        access_config {}
    }

    provisioner "file" {
        source = "files/puma.service"
        destination = "tmp/puma.service"
    }

    provisioner "file" {
        source = "files/deploy.sh"
    }
}

resource "google_compute_firewall" "firewall_puma" {
    name = "allow-puma-default"
    network = "default"
    allow {
        protocol = "tcp"
        ports = ["9292"]
    }
    source_ranges = ["0.0.0.0/0"]
    target_tags = ["reddit-app"]
}