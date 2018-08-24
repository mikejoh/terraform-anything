variable "cluster_name" {
    default = "gke-sandbox"
}
variable "zone" {
    default = "europe-west1-b"
}
variable "region" {
    default = "europe-west1"
}
variable "initial_node_count" {
    default = 2
}
variable "project" { 
    default = "sandbox"
}
variable "node_disk_size" {
    default = 20
}
variable "min_master_version" {
    default = "1.10.6-gke.2"
}