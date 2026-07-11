resource "okta_group" "salesforce_users" {
  name        = "Salesforce Users"
  description = "Salesforce application users"
}

resource "okta_group" "monday_app" {
  name        = "Monday App"
  description = "Monday application users"
}