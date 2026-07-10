module "salesforce" {
  source = "../../../../modules/okta-app-web-saml"
  
  app_label   = "Salesforce"
  sso_url     = "https://your-org.my.salesforce.com/services/auth/sso/OrganizationLogin"
  audience    = "https://saml.salesforce.com"
}

resource "okta_app_group_assignment" "salesforce_users" {
  app_id   = module.salesforce.app_id
  group_id = okta_group.salesforce_users.id
}