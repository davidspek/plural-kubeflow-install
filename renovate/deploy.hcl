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

  sha     = "h1:BwR89ylrZ+6f9yw639lVDIWOx6PdoGD7c+DTffeJ16o="
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

  sha     = "h1:BwR89ylrZ+6f9yw639lVDIWOx6PdoGD7c+DTffeJ16o="
  retries = 2
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

  sha     = "h1:BwR89ylrZ+6f9yw639lVDIWOx6PdoGD7c+DTffeJ16o="
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

  sha     = "fa81abc6a6a87d5db4309f3c54d6e5691b557fed90c94be7bb792b204ad5d93b"
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

  sha     = "h1:4MFUZgecXlPPx81ct765daHeg8xEl2SGdZ+8ZrKeD2M="
  retries = 2
  verbose = false
}
