module "zscaler" {
source = "../../../../../modules/okta-app-native-oidc"
  
  app_label              = "Zscaler"
  grant_types            = ["authorization_code", "refresh_token"]
  response_types         = ["code"]
  redirect_uris          = ["https://your-org.zscaler.com/sso/callback"]
  post_logout_redirect_uris = ["https://your-org.zscaler.com"]
}

resource "okta_app_group_assignment" "zscaler_app" {
  app_id   = module.zscaler.app_id
  group_id = okta_group.zscaler_app.id
}