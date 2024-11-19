variable "project_id" {
  description = "The ID of the project to associate the variable set with"
  type        = string
}

variable "variable_sets" {
  description = "List of variable set IDs to associate with the project"
  type        = list(string)
}
