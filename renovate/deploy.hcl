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

  sha     = "52e2b688fa9c6c092e74df723b49d70e41574cd7ebab8335d317e532b8e1745f"
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

  sha     = "h1:bWRcHeMH/OS/akbUTY7h9avegNc5aXwEAzT1q1bEL1w="
  retries = 1
}
