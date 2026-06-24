variable "app_label" {
  type        = string
  description = "Display name of the Okta application"
}

variable "redirect_uris" {
  type        = list(string)
  description = "List of allowed redirect URIs"
}

variable "post_logout_redirect_uris" {
  type        = list(string)
  description = "List of post-logout redirect URIs"
  default     = []
}
