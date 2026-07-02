module "Salesforce_app" {
  source        = "./modules/okta-app-web-saml"
  app_label     = "Salesforce Global"
  sso_url     = "https://salesforce.global.com"
  recipient   = "https://salesforce.global.com"
  destination = "https://salesforce.global.com"
  audience    = "https://salesforce.global.com"
}

module "dev_group" {
  source            = "../../modules/okta-groups"
  group_name        = "Salesforce Global Users"
  group_description = "Salesforce Users Group"
}
