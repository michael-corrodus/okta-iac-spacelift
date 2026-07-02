resource "web_saml_app" {
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
