module "monday.com" {
  source = "../../../../modules/okta-app-native-oidc"

  app_label             = "monday.com - IAM"
  redirect_uris         = ["https://your-org.monday.com/sso/callback"]
  post_logout_redirect_uris = ["https://your-org.monday.com"]
}

resource "okta_app_group_assignment" "monday_users" {
  app_id   = module.monday_users_id
  group_id = okta_group.monday_users.id
}