# Simple direct resource (no modules needed)
resource "okta_group" "developers" {
  name        = "Terraform Developers"
  description = "Group created via Terraform and Spacelifts"
}

resource "okta_group" "engineers" {
  name        = "Engineers"
  description = "Engineering team"
}
