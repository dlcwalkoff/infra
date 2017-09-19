resource "google_compute_instance" "app" {
  name         = "reddit-app"
  machine_type = "g1-small"
  zone         = "europe-west1-b"
  tags         = ["reddit-app"]

  metadata {
    sshKeys = "appuser:${file(var.public_key_path)}"
  }

  boot_disk {
    initialize_params {
      image = "${var.app_disk_image}"
    }
  }

  network_interface {
    network = "default"
    access_config = {}
  }
}