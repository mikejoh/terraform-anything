resource "google_compute_network" "instance-network" {
  name = "instance-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "instance-subnet" {
  name   = "instance-subnet"
  region = "${var.region}"
  ip_cidr_range = "${var.ip_cidr_range}"
  network = "${google_compute_network.instance-network.self_link}"
}

resource "google_compute_firewall" "allow-instance" {
  name    = "allow-instance-ports-from-external"
  network = "${google_compute_network.instance-network.self_link}"

  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports    = ["443", "80", "8080"]
  }
}