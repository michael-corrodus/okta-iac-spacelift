resource "okta_app_oauth" "web_oidc" {
  label                      = var.app_label
  type                       = "web"
  grant_types                = ["authorization_code", "refresh_token"]
  response_types             = ["code"] # <-- Highly recommended for strict state tracking
  redirect_uris              = var.redirect_uris
  post_logout_redirect_uris  = var.post_logout_redirect_uris
  token_endpoint_auth_method = "client_secret_basic"
}
