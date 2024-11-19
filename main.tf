locals {
  environments = ["npe", "prd", "sbx"]

  project_types = {
    "ASE"            = "This is ASE Project for all ASE-related workspaces"
    "App-Foundation" = "This is App Foundation Project for all App Foundation-related workspaces"
    "AKS"            = "This is AKS Project for all AKS-related workspaces"
    "Landing-Zone"   = "This is Landing Zone Project for all LZ-related workspaces"
  }

  global_variable_sets = ["AZURE-CLOUD30-DYNAMIC-CREDS", "AZURE-CLOUD30-DOCKER-REGISTRY", "AZURE-CLOUD30-VENAFI-API"]

  env_variable_sets = {
    "npe" = ["AZURE-CLOUD30-CPT-RBAC-NPE-SPN", "AZURE-CLOUD30-NETWORKING-INFRA-NPE-SPN"]
    "prd" = ["AZURE-CLOUD30-CPT-RBAC-PRD-SPN", "AZURE-CLOUD30-NETWORKING-INFRA-PRD-SPN"]
    "sbx" = ["AZURE-CLOUD30-CPT-RBAC-SBX-SPN", "AZURE-CLOUD30-NETWORKING-INFRA-SBX-SPN"]
  }

  projects = flatten([
    for env in local.environments : [
      for project_type, description in local.project_types : {
        project_name  = "Cloud-3-0-${project_type}-${upper(env)}-Project"
        description   = description
        environment   = env
        variable_sets = concat(local.global_variable_sets, local.env_variable_sets[env])
      }
    ]
  ])
}

# Creating projects dynamically
module "tfc_project" {
  source = "./modules/projects"

  for_each      = { for idx, project in local.projects : idx => project }
  project_name  = each.value.project_name
  description   = each.value.description
  environment   = each.value.environment
  tfc_organization = var.tfc_organization
}

# Associating variable sets with projects
module "tfc_variable_set" {
  source = "./modules/variable-set"

  for_each = { for idx, project in local.projects : idx => project }
  project_id      = module.tfc_project[each.key].project_id
  variable_sets   = each.value.variable_sets
}
