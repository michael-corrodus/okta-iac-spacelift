resource "okta_group" "salesforce_users" {
  name        = "Salesforce Users"
  description = "Salesforce application users"
}

resource "okta_group" "monday_users" {
  name        = "Monday.com Users"
  description = "Access to monday.com app users"
}