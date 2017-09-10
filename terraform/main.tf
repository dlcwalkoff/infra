provider "google" {
    project = "my-otus"
    region = "europe-west1"
}

resource "google_compute_instance" "app" {
    name = "reddit-app"
    machine_type = "g1-small"
    zone = "europe-west1"

    boot_disk {
        initialize_params {
            image = "reddit-base-1505035847"
        }
    }

    network_interface {
        network = "default"
        access_config {}
    }
}