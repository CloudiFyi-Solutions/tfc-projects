variable "project_name" {
  description = "The name of the Terraform Cloud project"
  type        = string
}

variable "description" {
  description = "Description of the Terraform Cloud project"
  type        = string
}

variable "environment" {
  description = "The environment of the project (e.g., npe, prd, sbx)"
  type        = string
}

variable "tfc_organization" {
  description = "The Terraform Cloud organization name"
  type        = string
}
