variable "app_label" {
  type        = string
  description = "Display name of the Okta application"
}

variable "sso_url" {
  type        = string
  description = "SSO URL (ACS URL) for the SAML app"
}

variable "audience" {
  type        = string
  description = "Audience URI (Entity ID) for the SAML app"
}
