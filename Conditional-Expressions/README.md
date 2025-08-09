# Terraform GCP VM Deployment (with Conditional VM Count)

This Terraform configuration demonstrates using a **conditional expression** to decide how many VMs to create based on the environment.

## Key Feature — Conditional Expression
```hcl
locals {
  vm_count = var.environment == "prod" ? 3 : 2
}
If environment is "prod" → create 3 VMs

Otherwise → create 2 VMs

Setting the Environment
You can set the environment variable in two ways:

- Default value (in variables.tf):
variable "environment" {
  default = "dev"
}

- CLI argument (overrides default)
terraform apply -var="environment=prod"
VM Details
Google Compute Engine e2-medium instances

Debian 11 image

Zone: europe-west2-a

Attached to the default network with external IPs

Unique names using count.index



