terraform {
  required_providers {
    tfe = {
      source = "hashicorp/tfe"
      version = "0.60.0"
    }
  }
}

provider "tfe" {
} 