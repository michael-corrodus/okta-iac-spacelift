module "slack" {
  source = "../../../../modules/okta-app-web-saml"

  app_label = "slack"
  sso_url   = "https://your-domain.slack.com/sso/saml"
  audience  = "https://your-domain.slack.com"
}

resource "okta_app_group_assignment" "slack_users" {
  app_id   = module.slack.app_id
  group_id = okta_group.slack_users.id
}
