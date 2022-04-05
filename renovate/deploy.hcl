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
}

step "kube-init" {
  wkdir   = "renovate"
  target  = "renovate/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "32abdd3241a89a98305f34e8e6ac32859c07a4e3f8900909bef382562106667a"
  retries = 0
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

  sha     = "h1:sI22ftQ8kay0PnA+jNG2PCc5aJsRZhpThQO0HMPnT3c="
  retries = 1
}
