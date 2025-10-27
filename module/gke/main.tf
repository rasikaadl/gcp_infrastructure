resource "google_container_cluster" "primary" {
name = var.cluster_name
location = var.location
network = var.network
subnetwork = var.subnetwork


remove_default_node_pool = true
initial_node_count = 1


ip_allocation_policy {
cluster_ipv4_cidr_block = var.cluster_ipv4_cidr
}


addons_config {
http_load_balancing {}
horizontal_pod_autoscaling {}
}


master_authorized_networks_config {
cidr_blocks = var.master_authorized_cidrs
}


release_channel {
channel = var.release_channel
}


workload_identity_config {
workload_pool = "${var.project}.svc.id.goog"
}
}


resource "google_container_node_pool" "default" {
name = "default-pool"
cluster = google_container_cluster.primary.name
location = var.location
node_count = var.node_count


node_config {
machine_type = var.node_machine_type
oauth_scopes = [
"https://www.googleapis.com/auth/cloud-platform",
]
metadata = var.node_metadata
labels = var.node_labels
}


management {
auto_repair = true
auto_upgrade = true
}
}