# terraform-okta-spacelift

Infrastructure-as-Code for managing Okta applications and groups, deployed via Spacelift.

## Structure

- `.spacelift/` — Spacelift stack config and OPA policies
- `modules/` — Reusable Terraform modules per app type
- `environments/dev/` — Dev environment entrypoint

## Getting started

1. Set `OKTA_API_TOKEN` as a secret in your Spacelift stack context
2. Update `environments/dev/dev.tfvars` with your Okta org URL
3. Connect this repo to a Spacelift stack pointing at `environments/dev/`

## Adding environments

Copy `environments/dev/` to `environments/staging/` or `environments/prod/` and create a new Spacelift stack for each.
