metadata {
  path = "renovate"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "renovate/terraform"
  target  = "renovate/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:VYAHqQLTtnu9AVpZAKaG5uVbwPMK0NWHidDlrM220iI="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "renovate/terraform"
  target  = "renovate/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:VYAHqQLTtnu9AVpZAKaG5uVbwPMK0NWHidDlrM220iI="
  retries = 1
  verbose = false
}

step "terraform-output" {
  wkdir   = "renovate"
  target  = "renovate/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "renovate",
  ]

  sha     = "h1:VYAHqQLTtnu9AVpZAKaG5uVbwPMK0NWHidDlrM220iI="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "renovate"
  target  = "renovate/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "de120dd2092d771df3fc6311baeb1869dde868f809d9f4bc3f93ba33a189124e"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "renovate"
  target  = "renovate/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "renovate",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "renovate"
  target  = "renovate/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "renovate",
  ]

  sha     = "h1:aZPD41fSWujoy5+0uQOy6B7cwZ1utMRgLkDnUIS+AJA="
  retries = 1
  verbose = false
}
