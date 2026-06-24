resource "okta_app_oauth" "spa_oidc" {
  label                      = var.app_label
  type                       = "browser"
  grant_types                = ["authorization_code", "refresh_token"] # <-- Swap implicit for refresh_token
  response_types             = ["code"]                                 # <-- Explicitly tell Okta to expect PKCE code
  redirect_uris              = var.redirect_uris
  post_logout_redirect_uris  = var.post_logout_redirect_uris
  token_endpoint_auth_method = "none"                                  # <-- Correct for SPAs (Public Clients)
  pkce_required              = true
}
