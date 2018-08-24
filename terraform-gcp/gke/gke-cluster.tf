resource "google_container_cluster" "gke-sandbox" {
  name               = "${var.cluster_name}"
  description        = "GKE sandbox"
  zone               = "${var.zone}"
  initial_node_count = "${var.initial_node_count}"

  enable_kubernetes_alpha = "true"

  min_master_version = "${var.min_master_version}"

  addons_config {
    kubernetes_dashboard {
      disabled = true
    }
  }

  master_auth {
    username = ""
    password = ""
    client_certificate_config {
      issue_client_certificate = true
    }
  }

node_config {
  disk_size_gb = "${var.node_disk_size}"
  oauth_scopes = [
    "https://www.googleapis.com/auth/compute",
    "https://www.googleapis.com/auth/devstorage.read_only",
    "https://www.googleapis.com/auth/logging.write",
    "https://www.googleapis.com/auth/monitoring"
  ]
 }
}