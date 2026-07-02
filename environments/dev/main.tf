# ============================================================================
# GROUPS (already created, but shown for reference)
# ============================================================================

resource "okta_group" "developers" {
  name        = "Terraform Developers"
  description = "Group created and managed by Terraform via Spacelifts"
}

resource "okta_group" "engineers" {
  name        = "Engineers"
  description = "Engineering team"
}

resource "okta_group" "product" {
  name        = "Product"
  description = "Product team"
}

# ============================================================================
# 1. NATIVE OIDC APP
# ============================================================================

module "native_oidc_app" {
source = "../../modules/okta-app-native-oidc"

  app_label              = "Test Native OIDC App"
  grant_types            = ["authorization_code", "refresh_token"]
  response_types         = ["code"]
  redirect_uris          = ["http://localhost:3000/callback"]
  post_logout_redirect_uris = ["http://localhost:3000"]
}

resource "okta_app_group_assignment" "developers_to_native_oidc" {
  app_id   = module.native_oidc_app.app_id
  group_id = okta_group.developers.id
}

resource "okta_app_group_assignment" "engineers_to_native_oidc" {
  app_id   = module.native_oidc_app.app_id
  group_id = okta_group.engineers.id
}

# ============================================================================
# 2. SPA OIDC APP
# ============================================================================

module "spa_oidc_app" {
source = "../../modules/okta-app-spa-oidc"

  app_label              = "Test SPA OIDC App"
  redirect_uris          = ["http://localhost:3001/callback"]
  post_logout_redirect_uris = ["http://localhost:3001"]
}

resource "okta_app_group_assignment" "product_to_spa_oidc" {
  app_id   = module.spa_oidc_app.app_id
  group_id = okta_group.product.id
}

resource "okta_app_group_assignment" "developers_to_spa_oidc" {
  app_id   = module.spa_oidc_app.app_id
  group_id = okta_group.developers.id
}

# ============================================================================
# 3. WEB OIDC APP
# ============================================================================

module "web_oidc_app" {
source = "../../modules/okta-app-web-oidc"

  app_label              = "Test Web OIDC App"
  grant_types            = ["authorization_code", "refresh_token"]
  response_types         = ["code"]
  redirect_uris          = ["http://localhost:3002/callback"]
  post_logout_redirect_uris = ["http://localhost:3002"]
}

resource "okta_app_group_assignment" "engineers_to_web_oidc" {
  app_id   = module.web_oidc_app.app_id
  group_id = okta_group.engineers.id
}

resource "okta_app_group_assignment" "product_to_web_oidc" {
  app_id   = module.web_oidc_app.app_id
  group_id = okta_group.product.id
}

# ============================================================================
# 4. WEB SAML APP
# ============================================================================

module "web_saml_app" {
source = "../../modules/okta-app-web-saml"

  app_label            = "Test Web SAML App"
  sso_url              = "http://localhost:3003/saml/consume"
  audience             = "http://localhost:3003"
}

resource "okta_app_group_assignment" "developers_to_web_saml" {
  app_id   = module.web_saml_app.app_id
  group_id = okta_group.developers.id
}

resource "okta_app_group_assignment" "engineers_to_web_saml" {
  app_id   = module.web_saml_app.app_id
  group_id = okta_group.engineers.id
}

resource "okta_app_group_assignment" "product_to_web_saml" {
  app_id   = module.web_saml_app.app_id
  group_id = okta_group.product.id
}
