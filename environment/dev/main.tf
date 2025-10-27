terraform {
  required_version = ">= 1.6.0"
  backend "gcs" {}
}

provider "google" {
  project = var.project_id
  region  = var.region
}

module "gke" {
  source            = "../../modules/gke"
  cluster_name      = "dev-gke"
  region            = var.region
  network           = module.network.network_self_link
  subnetwork        = module.network.subnet_name
  node_count        = 2
  node_machine_type = "e2-medium"
}