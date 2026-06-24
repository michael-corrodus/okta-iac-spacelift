resource "okta_app_saml" "web_saml" {
  label             = var.app_label
  sso_url           = var.sso_url
  recipient         = var.sso_url
  destination       = var.sso_url
  audience          = var.audience
  subject_name_id_template = "$${user.userName}"
  subject_name_id_format   = "urn:oasis:names:tc:SAML:1.1:nameid-format:emailAddress"
  response_signed   = true
  signature_algorithm = "RSA_SHA256"
  digest_algorithm  = "SHA256"
  honor_force_authn = false
  authn_context_class_ref = "urn:oasis:names:tc:SAML:2.0:ac:classes:PasswordProtectedTransport"
}
