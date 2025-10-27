terraform {
  required_version = ">= 1.6.0"
  
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "7.8.0"
    }
  }
}