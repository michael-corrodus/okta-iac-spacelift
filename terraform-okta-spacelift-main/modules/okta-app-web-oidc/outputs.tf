output "app_id" {
  value       = okta_app_oauth.web_oidc.id
  description = "Okta application ID"
}

output "client_id" {
  value       = okta_app_oauth.web_oidc.client_id
  description = "OIDC client ID"
}

output "client_secret" {
  value       = okta_app_oauth.web_oidc.client_secret
  description = "OIDC client secret"
  sensitive   = true
}
