# 1. OIDC APP
resource "okta_app_oauth" "test_oidc_app" {
  label                      = "Test OIDC App"
  type                       = "web"
  grant_types                = ["authorization_code", "refresh_token"]
  response_types             = ["code"]
  redirect_uris              = ["http://localhost:3000/callback"]
  post_logout_redirect_uris  = ["http://localhost:3000"]
}

resource "okta_app_group_assignment" "developers_to_oidc" {
  app_id   = okta_app_oauth.test_oidc_app.id
  group_id = okta_group.developers.id
}

resource "okta_app_group_assignment" "engineers_to_oidc" {
  app_id   = okta_app_oauth.test_oidc_app.id
  group_id = okta_group.engineers.id
}

# 2. SAML APP
resource "web_saml" "test_saml_app" {
  label                = "Test SAML App"
  single_sign_on_url             = "http://localhost:3000/saml/consume"
  recipient                      = "http://localhost:3000/saml/consume"
  destination                    = "http://localhost:3000/saml/consume"
  audience                       = "http://localhost:3000"
  subject_name_id_format         = "urn:oasis:names:tc:SAML:1.1:nameid-format:emailAddress"
  subject_name_id_template       = "${user.email}"
  response_signed                = true
  signature_algorithm            = "RSA_SHA256"
  digest_algorithm               = "SHA256"
  
  attribute_statements {
    type      = "EXPRESSION"
    name      = "email"
    values    = ["user.email"]
  }
  
  attribute_statements {
    type      = "EXPRESSION"
    name      = "firstName"
    values    = ["user.firstName"]
  }
  
  attribute_statements {
    type      = "EXPRESSION"
    name      = "lastName"
    values    = ["user.lastName"]
  }
}

resource "okta_app_group_assignment" "product_to_saml" {
  app_id   = okta_app_saml.test_saml_app.id
  group_id = okta_group.product.id
}

resource "okta_app_group_assignment" "developers_to_saml" {
  app_id   = okta_app_saml.test_saml_app.id
  group_id = okta_group.developers.id
}

# 3. PRECONFIG APP
resource "web_saml" "test_preconfig_app" {
  label                = "Test Preconfig App (Slack)"
  single_sign_on_url             = "https://yourslack.slack.com/sso/saml"
  recipient                      = "https://yourslack.slack.com/sso/saml"
  destination                    = "https://yourslack.slack.com/sso/saml"
  audience                       = "https://yourslack.slack.com"
  subject_name_id_format         = "urn:oasis:names:tc:SAML:1.1:nameid-format:emailAddress"
  subject_name_id_template       = "${user.email}"
  response_signed                = true
  signature_algorithm            = "RSA_SHA256"
  
  attribute_statements {
    type      = "EXPRESSION"
    name      = "email"
    values    = ["user.email"]
  }
  
  attribute_statements {
    type      = "EXPRESSION"
    name      = "firstName"
    values    = ["user.firstName"]
  }
  
  attribute_statements {
    type      = "EXPRESSION"
    name      = "lastName"
    values    = ["user.lastName"]
  }
}

resource "okta_app_group_assignment" "engineers_to_preconfig" {
  app_id   = okta_app_saml.test_preconfig_app.id
  group_id = okta_group.engineers.id
}

resource "okta_app_group_assignment" "product_to_preconfig" {
  app_id   = okta_app_saml.test_preconfig_app.id
  group_id = okta_group.product.id
}

output "oidc_app_client_id" {
  value       = okta_app_oauth.test_oidc_app.client_id
  description = "OIDC App Client ID"
}

output "oidc_app_client_secret" {
  value       = okta_app_oauth.test_oidc_app.client_secret
  sensitive   = true
  description = "OIDC App Client Secret"
}

output "saml_app_metadata_url" {
  value       = okta_app_saml.test_saml_app.metadata_url
  description = "SAML App Metadata URL"
}

output "preconfig_app_metadata_url" {
  value       = okta_app_saml.test_preconfig_app.metadata_url
  description = "Preconfig App Metadata URL"
}
