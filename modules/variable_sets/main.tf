resource "tfe_project_variable_set" "this" {
  for_each = toset(var.variable_sets)

  project_id      = var.project_id
  variable_set_id = each.value
}
