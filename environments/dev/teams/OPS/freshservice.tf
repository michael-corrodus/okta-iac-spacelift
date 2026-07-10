module "freshservice" {
  source = "../../../../modules/okta-app-web-oidc"
  
  app_label              = "Freshservice"
  grant_types            = ["authorization_code", "refresh_token"]
  response_types         = ["code"]
  redirect_uris          = ["https://your-domain.freshservice.com/oauth/callback"]
  post_logout_redirect_uris = ["https://your-domain.freshservice.com"]
}

resource "okta_app_group_assignment" "freshservice_users" {
  app_id   = module.freshservice.app_id
  group_id = okta_group.freshservice_users.id
}