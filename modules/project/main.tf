resource "tfe_project" "this" {
  name         = var.project_name
  organization = var.tfc_organization
}

output "project_id" {
  value = tfe_project.this.id
}
