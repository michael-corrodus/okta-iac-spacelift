# Direct resource - no modules needed for testing
resource "okta_group" "developers" {
  name        = "Terraform Developers"
  description = "Group created and managed by Terraform via Spacelifts"
}

resource "okta_group" "engineers" {
  name        = "Engineers"
  description = "Engineering team"
}

resource "okta_group" "product" {
  name        = "Product"
  description = "Product team"
}

# Create an OIDC application
resource "okta_app_oauth" "my_app" {
  label                      = "My Test App"
  type                       = "web"
  grant_types                = ["authorization_code", "refresh_token"]
  response_types             = ["code"]
  redirect_uris              = ["http://localhost:3000/callback"]
  post_logout_redirect_uris  = ["http://localhost:3000"]
}

# Assign the Developers group to the app
resource "okta_app_group_assignment" "developers_to_app" {
  app_id   = okta_app_oauth.my_app.id
  group_id = okta_group.developers.id
}

# Assign the Engineers group to the app
resource "okta_app_group_assignment" "engineers_to_app" {
  app_id   = okta_app_oauth.my_app.id
  group_id = okta_group.engineers.id
}
