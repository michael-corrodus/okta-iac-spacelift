module "freshservice" {
  source = "../../../../modules/okta-app-web-saml"

  app_label = "Freshservice"
  sso_url   = "https://your-domain.freshservice.com/sso/saml"
  audience  = "https://your-domain.freshservice.com"
}

resource "okta_app_group_assignment" "freshservice_users" {
  app_id   = module.freshservice.app_id
  group_id = okta_group.freshservice_users.id
}
