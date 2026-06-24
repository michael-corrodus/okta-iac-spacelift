locals {
  desc_map = {
    for idx, name in var.group_names :  # <-- toset() removed here
    name => try(var.descriptions[idx], "Managed by Terraform for ${name}")
  }
}

resource "okta_group" "g" {
  for_each    = toset(var.group_names)
  name        = each.value
  description = lookup(local.desc_map, each.value, "Managed by Terraform")
}

output "groups" {
  value = [for g in okta_group.g : { id = g.id, name = g.name }]
}
