variable "project" { type = string }
variable "cluster_name" { type = string }
variable "location" { type = string }
variable "network" { type = string }
variable "subnetwork" { type = string }
variable "node_count" { type = number default = 3 }
variable "node_machine_type" { type = string default = "e2-medium" }
variable "node_metadata" { type = map(string) default = {} }
variable "node_labels" { type = map(string) default = {} }
variable "cluster_ipv4_cidr" { type = string default = null }
variable "secondary_range_name_pods" { type = string }
variable "secondary_range_name_services" { type = string }
variable "master_authorized_cidrs" { type = list(object({ cidr = string, display_name = string })) default = [] }
variable "release_channel" { type = string default = "REGULAR" }