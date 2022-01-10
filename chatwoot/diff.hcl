metadata {
  path = "chatwoot"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "chatwoot/terraform"
  target  = "chatwoot/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:9mBR26I+6Dyq/jqfn/2GcOVwzxmcdwgI3loNsNiRywg="
  retries = 0
}

step "terraform" {
  wkdir   = "chatwoot/terraform"
  target  = "chatwoot/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "chatwoot",
  ]

  sha     = "h1:9mBR26I+6Dyq/jqfn/2GcOVwzxmcdwgI3loNsNiRywg="
  retries = 0
}

step "kube-init" {
  wkdir   = "chatwoot"
  target  = "chatwoot/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "chatwoot",
  ]

  sha     = "2423892a9776f02f2ef90d53d0c6134c2ac605ffaab31f2e3d94fcb5eff55f56"
  retries = 0
}

step "helm" {
  wkdir   = "chatwoot/helm"
  target  = "chatwoot/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "chatwoot",
  ]

  sha     = "h1:ZXZKG/9IkJArfQcZDV6dj+D822hkqJ0iY+Cd52vgDjE="
  retries = 0
}
