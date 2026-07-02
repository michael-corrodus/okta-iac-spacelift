# 1. OIDC APP (Web Application)
# ============================================================================
resource "okta_app_oauth" "test_oidc_app" {
  label                      = "Michael Marketing OIDC App"
  type                       = "web"
  grant_types                = ["authorization_code", "refresh_token"]
  response_types             = ["code"]
  redirect_uris              = ["http://localhost:3000/callback"]
  post_logout_redirect_uris  = ["http://localhost:3000"]
}

# Assign groups to OIDC app
resource "okta_app_group_assignment" "developers_to_oidc" {
  app_id   = okta_app_oauth.test_oidc_app.id
  group_id = okta_group.developers.id
}

resource "okta_app_group_assignment" "engineers_to_oidc" {
  app_id   = okta_app_oauth.test_oidc_app.id
  group_id = okta_group.engineers.id
}

---

# 2. SAML APP (Web/Enterprise Application)
# ============================================================================
resource "okta_app_saml" "test_saml_app" {
  label                = "Michael Sales App"
  
  # SAML Config
  single_sign_on_url             = "http://localhost:3000/saml/consume"
  recipient                      = "http://localhost:3000/saml/consume"
  destination                    = "http://localhost:3000/saml/consume"
  audience                       = "http://localhost:3000"
  subject_name_id_format         = "urn:oasis:names:tc:SAML:1.1:nameid-format:emailAddress"
  subject_name_id_template       = "${user.email}"
  response_signed                = true
  signature_algorithm            = "RSA_SHA256"
  digest_algorithm               = "SHA256"
  
  # Attribute mappings
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

# Assign groups to SAML app
resource "okta_app_group_assignment" "product_to_saml" {
  app_id   = okta_app_saml.test_saml_app.id
  group_id = okta_group.product.id
}

resource "okta_app_group_assignment" "developers_to_saml" {
  app_id   = okta_app_saml.test_saml_app.id
  group_id = okta_group.developers.id
}

---

# 3. PRECONFIG APP (SaaS Application - Slack Example)
# ============================================================================
resource "okta_app_saml" "test_preconfig_app" {
  label                = "Michael App (Slack)"
  
  # Single sign-on URL (Slack example)
  single_sign_on_url             = "https://yourslack.slack.com/sso/saml"
  recipient                      = "https://yourslack.slack.com/sso/saml"
  destination                    = "https://yourslack.slack.com/sso/saml"
  audience                       = "https://yourslack.slack.com"
  subject_name_id_format         = "urn:oasis:names:tc:SAML:1.1:nameid-format:emailAddress"
  subject_name_id_template       = "${user.email}"
  response_signed                = true
  signature_algorithm            = "RSA_SHA256"
  
  # Slack attribute mappings
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

# Assign groups to preconfig app
resource "okta_app_group_assignment" "engineers_to_preconfig" {
  app_id   = okta_app_saml.test_preconfig_app.id
  group_id = okta_group.engineers.id
}

resource "okta_app_group_assignment" "product_to_preconfig" {
  app_id   = okta_app_saml.test_preconfig_app.id
  group_id = okta_group.product.id
}
