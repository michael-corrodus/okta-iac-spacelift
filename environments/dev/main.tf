module "dev_group" {
  source            = "../../modules/okta-groups"
  group_name        = "dev-team"
  group_description = "Development team group"
}

module "dev_web_app" {
  source        = "../../modules/okta-app-web-oidc"
  app_label     = "dev-web-app"
  redirect_uris = ["https://dev.example.com/callback"]
}
