resource "google_compute_instance" "single-instance" {
    name         = "${var.name}"
    project      = "${var.project}"
    machine_type = "${var.machine_type}"
    zone         = "${var.zone}"
    tags         = ["${var.name}"]

    boot_disk {
        initialize_params {
            image = "${var.image}"
            size = "${var.disk_size}"
        }
    }

    network_interface {
        subnetwork = "${google_compute_subnetwork.instance-subnet.self_link}"
        address = "${var.address}"
        access_config {
        }
    }

    service_account {
        scopes = [ "compute-rw", "storage-ro", "service-management", "service-control", "logging-write", "monitoring" ]
    }
}
