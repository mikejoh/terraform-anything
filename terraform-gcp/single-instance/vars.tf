variable "image" {
    default = "ubuntu-os-cloud/ubuntu-1804-lts"
} 
variable "disk_size" {
    default = 20
}
variable "machine_type" {
    default = "n1-standard-1"
}
variable "zone" {
    default = "europe-west1-b"
}
variable "region" {
    default = "europe-west1"
}
variable "project" { 
    default = "sandbox"
}
variable "name" {
    default = "single-instance"
} 
variable "address" {
    default = "10.240.1.10"
}
variable "ip_cidr_range" {
    default = "10.240.1.0/24"
}