locals {
  projects = {
    "AKS" = {
      name        = "AKS Project"
      description = "This is the default project."
    },
    "PLZ" = {
      name        = "Landing Zone Project"
      description = "This project is for development."
    },
    "ASE" = {
      name        = "ASE Project"
      description = "This project is for staging."
    },
    "App Foundation" = {
      name        = "App Foundation Project"
      description = "This project is for production."
    }
  }
}

# Looping through each project
module "projects" {
  source        = "./modules/project"
  for_each      = local.projects

  organization  = var.organization
  project_name  = each.value.name
  description   = each.value.description
}

#Output
output "project_ids" {
  value = { for project, details in module.projects : project => details.project_id }
}
