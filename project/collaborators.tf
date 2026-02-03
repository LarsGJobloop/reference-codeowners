locals {
  leads = [
    "zabronax",
    # "lead2",
    # "lead3",
  ]
  assistants = [
    # "assistant1",
    # "assistant2",
    # "assistant3",
  ]
}

resource "github_repository_collaborator" "leads" {
  for_each = toset(local.leads)
  repository = github_repository.repository.name
  username = each.value
  permission = "admin"
}

resource "github_repository_collaborator" "assistants" {
  for_each = toset(local.assistants)
  repository = github_repository.repository.name
  username = each.value
  permission = "push"
}

output "leads" {
  description = "The leads of the repository"
  value = [for collaborator in github_repository_collaborator.leads : collaborator.username]
  sensitive = false
}

output "assistants" {
  description = "The assistants of the repository"
  value = [for collaborator in github_repository_collaborator.assistants : collaborator.username]
  sensitive = false
}
