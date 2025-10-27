resource "google_container_cluster" "primary" {
name = var.cluster_name
location = var.location
project = var.project
network = var.network
subnetwork = var.subnetwork

initial_node_count = 1
remove_default_node_pool = true

ip_allocation_policy {
cluster_ipv4_cidr_block = var.cluster_ipv4_cidr
}

addons_config {
http_load_balancing {
  disabled = false
}

horizontal_pod_autoscaling {
  disabled = false
}
}

release_channel {
channel = var.release_channel
}

workload_identity_config {
workload_pool = "${var.project}.svc.id.goog"
}

master_authorized_networks_config {
dynamic "cidr_blocks" {
for_each = var.master_authorized_cidrs
content {
cidr_block = cidr_blocks.value.cidr
display_name = cidr_blocks.value.display_name
}
}
}

node_config {
# placeholder node config required by some API versions when remove_default_node_pool = false
}

depends_on = []
}

resource "google_container_node_pool" "primary_nodes" {
name = "primary-pool"
cluster = google_container_cluster.primary.name
location = var.location

node_count = var.node_count

node_config {
preemptible = var.node_preemptible
machine_type = var.node_machine_type
oauth_scopes = ["https://www.googleapis.com/auth/cloud-platform"]
labels = var.node_labels
metadata = var.node_metadata
}

management {
auto_repair = true
auto_upgrade = true
}
}