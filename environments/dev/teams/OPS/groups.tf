resource "okta_group" "freshservice_users" {
  name        = "Freshservice Users"
  description = "Freshservice application users"
}

resource "okta_group" "slack_users" {
  name        = "Slack Users"
  description = "Users assigned to Slack App"
}
