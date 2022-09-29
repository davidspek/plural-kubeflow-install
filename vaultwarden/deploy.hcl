metadata {
  path = "vaultwarden"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "vaultwarden/terraform"
  target  = "vaultwarden/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:jSXSA01dQPo/g/0sLxvChed3i3paVGQfwmChVsgTotE="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "vaultwarden/terraform"
  target  = "vaultwarden/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:jSXSA01dQPo/g/0sLxvChed3i3paVGQfwmChVsgTotE="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "vaultwarden"
  target  = "vaultwarden/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "vaultwarden",
  ]

  sha     = "h1:jSXSA01dQPo/g/0sLxvChed3i3paVGQfwmChVsgTotE="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "vaultwarden"
  target  = "vaultwarden/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "619d931eab5d981ffa29024d4d60406e8918136c79e24e972a0ce4ec0351ea94"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "vaultwarden"
  target  = "vaultwarden/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "vaultwarden",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "vaultwarden"
  target  = "vaultwarden/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "vaultwarden",
  ]

  sha     = "h1:MC0JsONOqTL8g9thdJpzCZVwaJhtXaO5xOwh4/PQA30="
  retries = 2
  verbose = false
}
