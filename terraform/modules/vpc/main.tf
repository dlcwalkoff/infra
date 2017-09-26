resource "google_compute_firewall" "firewall_mongo" {
  name    = "allow-mongo-default"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["27017"]
  }

  source_ranges = "${var.mongo_source_ranges}"
  target_tags   = "${var.mongo_target_tags}"
  source_tags   = "${var.mongo_source_tags}"
}

resource "google_compute_firewall" "firewall_puma" {
  name    = "allow-puma-default"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["9292"]
  }

  source_ranges = "${var.puma_source_ranges}"
  target_tags   = "${var.puma_target_tags}"
}

resource "google_compute_firewall" "firewall_ssh" {
  name    = "allow-default-ssh"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = "${var.ssh_allow_ports}"
  }

  source_ranges = "${var.ssh_source_ranges}"
}
