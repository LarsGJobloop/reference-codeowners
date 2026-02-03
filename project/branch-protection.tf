resource "github_branch_protection" "main" {
  repository_id = github_repository.repository.id
  # Branch name to match against
  pattern = "main"

  # Enforce for admins as well
  enforce_admins = false
  # Don't require signed commits
  require_signed_commits = false

  # Prevent deletions
  allows_deletions = false

  # Prevent force pushes
  allows_force_pushes = false

  # Prevent non-linear history (ie merge commits)
  required_linear_history = true

  required_status_checks {
    strict = true
    # Use the workflow job name here (exact match)
    # ---.github/workflows/**.yaml
    # jobs:
    #   format-check:
    #     name: format-check <--- **This** is the value to use
    # ---
    contexts = [
      "format-check"
    ]
  }

  # Review requirements
  required_pull_request_reviews {
    # Drop approvals when reviews are stale
    dismiss_stale_reviews = true
    # Require reviews from code owners
    require_code_owner_reviews = true
    # Require at least one approving review
    required_approving_review_count = 1
  }
}
