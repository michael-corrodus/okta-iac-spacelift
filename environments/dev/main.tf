# Keep this old code
resource "okta_app_oauth" "my_app" {
  label                      = "My Test App"
  type                       = "web"
  grant_types                = ["authorization_code", "refresh_token"]
  response_types             = ["code"]
  redirect_uris              = ["http://localhost:3000/callback"]
  post_logout_redirect_uris  = ["http://localhost:3000"]
}

resource "okta_app_group_assignment" "developers_to_app" {
  app_id   = okta_app_oauth.my_app.id
  group_id = okta_group.developers.id
}

resource "okta_app_group_assignment" "engineers_to_app" {
  app_id   = okta_app_oauth.my_app.id
  group_id = okta_group.engineers.id
}

# PLUS your new module code
module "native_oidc_app" {
  source = "../../modules/okta-app-native-oidc"
}

module "web_saml_app" {
source = "../../modules/okta-app-web-saml"

  app_label            = "New SAML App"
  sso_url              = "http://localhost:3003/saml/consume"
  audience             = "http://localhost:3003"
}

resource "okta_group" "developers" {
  name        = "Terraform Developers"
  description = "Group created and managed by Terraform via Spacelifts"
}

resource "okta_app_group_assignment" "developers_to_web_saml" {
  app_id   = module.web_saml_app.app_id
  group_id = okta_group.developers.id
}
