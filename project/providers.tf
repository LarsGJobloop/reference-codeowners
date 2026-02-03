terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "6.10.2"
    }
  }
}

variable "github_token" {
  type        = string
  description = "The GitHub token to use for authentication"
  sensitive   = true
}

provider "github" {
  token = var.github_token
}
