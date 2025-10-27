variable "project" { type = string }
variable "cluster_name" { type = string }
variable "location" { type = string }
variable "network" { type = string }
variable "subnetwork" { type = string }
variable "node_count" {
  type    = number
  default = 3
}
variable "node_machine_type" {
  type    = string
  default = "e2-medium"
}
variable "node_preemptible" {
  type    = bool
  default = false
}
variable "node_labels" {
  type    = map(string)
  default = {}
}
variable "node_metadata" {
  type    = map(string)
  default = {}
}
variable "cluster_ipv4_cidr" {
  type    = string
  default = null
}
variable "release_channel" {
  type    = string
  default = "REGULAR"
}
variable "master_authorized_cidrs" {
type = list(object({ cidr = string, display_name = string }))
default = []
}