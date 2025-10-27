terraform {
  backend "gcs" {
    bucket      = "driver-team-tfstate"                # e.g. my-project-123-tfstate
    prefix      = "env/prod"                           # optional sub-folder
    credentials = "/root/terraform-backend-key.json"   # path to the SA key
    use_lockfile = true                                # Enables native state locking
  }
}