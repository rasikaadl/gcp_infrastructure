# terraform-gcp-infra (GKE-only example)

This repo contains a minimal module and environment layout for deploying a GKE cluster with Terraform.


Usage (dev):


```bash
cd envs/dev
export GOOGLE_APPLICATION_CREDENTIALS="/path/to/your/service-account.json"
terraform init
terraform plan -var-file=terraform.tfvars
terraform apply -var-file=terraform.tfvars
```


Notes:
- Do not commit service account keys to Git.
- Adjust `global/versions.tf` provider version pin to your required major version.