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
