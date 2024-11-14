variable "organization" {
  type        = string
  description = "The Terraform Cloud organization name"
  default     = "CloudiFyi-Solutions"
}

variable "project_name" {
  type        = string
  description = "The name of the project"
}

variable "description" {
  type        = string
  description = "Description of the project"
  default     = ""
}
