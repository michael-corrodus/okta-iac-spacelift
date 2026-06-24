resource "okta_app_oauth" "native_oidc" {
  label                      = var.app_label
  type                       = "native"
  grant_types                = ["authorization_code", "refresh_token"]
  response_types             = ["code"] # <-- Optional, but recommended for clarity
  redirect_uris              = var.redirect_uris
  post_logout_redirect_uris  = var.post_logout_redirect_uris
  token_endpoint_auth_method = "none"
}
