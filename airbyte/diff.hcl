metadata {
  path = "airbyte"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "airbyte/terraform"
  target  = "airbyte/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:iZppMj0+ETPokoE9167OEsf1Yy7Ijs19MwjqJE6Q+sg="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "airbyte/terraform"
  target  = "airbyte/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "airbyte",
  ]

  sha     = "h1:iZppMj0+ETPokoE9167OEsf1Yy7Ijs19MwjqJE6Q+sg="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "airbyte"
  target  = "airbyte/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "airbyte",
  ]

  sha     = "bd7acd798a896fd3ccd3e609f0c7b55ce0e5019ac7533600e63ddc2ec9650c46"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "airbyte/helm"
  target  = "airbyte/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "airbyte",
  ]

  sha     = "h1:rp5wZ0M4GFr8Z76KiYByv/XTW8GyalcWUlbTuhNpxx4="
  retries = 0
  verbose = false
}
