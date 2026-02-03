# Change Responsible

Using GitHub CODEOWNERS and Branch Protection for basic QA and shared ownership.

## Branch Protection

The `main` branch requires:
- Code owner approval (at least 1 review)
- Passing CI checks (format-check)
- Linear history (no merge commits)
- No force pushes or deletions

See `project/branch-protection.tf` for configuration.

## CODEOWNERS

This repository uses two CODEOWNERS files:

- **`/CODEOWNERS`**: Content area experts (backend, frontend, databases, devops)
- **`.github/CODEOWNERS`**: Admin and technical support (infrastructure, CI/CD, tooling)

GitHub automatically requests reviews from code owners based on changed files. Note that organizations have more flexible ownership options, including using teams instead of individual users.

### Ownership Overview

**Content Areas:**
- `/content/backend/` → `@zabronax`
- `/content/frontend/` → `@LarsGJobloop`
- `/content/databases/` → `@LarsGJobloop`
- `/content/devops/` → `@LarsGJobloop`

**Infrastructure:**
- Infrastructure files (`*.tf`, `/project/`) → `@LarsGJobloop`
- CI/CD workflows (`.github/workflows/`) → `@LarsGJobloop`
- Development tooling (`flake.nix`, `.envrc`, etc.) → `@LarsGJobloop`

**Admin:**
- Documentation (`README.md`, `LICENSE`) → `@LarsGJobloop`
- All other files → `@LarsGJobloop`

## CI Workflow

The CI workflow (`.github/workflows/contintuous-integration.yaml`) runs on all pull requests targeting `main`:

- **Format Check**: Validates that Terraform/OpenTofu files are properly formatted using `tofu fmt`

The workflow must pass before a PR can be merged. To fix formatting issues, run `tofu fmt -recursive` locally.

## References

- [GitHub CODEOWNERS documentation](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners)
- [GitHub Branch Protection documentation](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches/about-protected-branches)
