# Create a Terraform Cloud project
resource "tfe_project" "this" {
  name         = var.project_name
  organization = var.organization
  description  = var.description
}

# Output
output "project_id" {
  value = tfe_project.this.id
}
