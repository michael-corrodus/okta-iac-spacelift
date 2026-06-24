output "app_id" {
  value       = okta_app_oauth.spa_oidc.id
  description = "Okta application ID"
}

output "client_id" {
  value       = okta_app_oauth.spa_oidc.client_id
  description = "OIDC client ID"
}
