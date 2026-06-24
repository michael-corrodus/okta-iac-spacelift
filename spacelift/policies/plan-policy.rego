package spacelift

warn[msg] {
  count(input.terraform.resource_changes) > 5
  msg := "Large change detected — please review carefully"
}
