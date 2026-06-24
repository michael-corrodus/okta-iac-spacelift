output "app_id" {
  value       = okta_app_saml.web_saml.id
  description = "Okta application ID"
}

output "metadata_url" {
  value       = okta_app_saml.web_saml.metadata_url
  description = "SAML metadata URL"
}
