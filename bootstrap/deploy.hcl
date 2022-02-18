metadata {
  path = "bootstrap"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:pCz5juYAeUbAkIhGUIixYeG3cFzkekBT+jIZ/UmmrBg="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:pCz5juYAeUbAkIhGUIixYeG3cFzkekBT+jIZ/UmmrBg="
  retries = 1
}

step "terraform-output" {
  wkdir   = "bootstrap"
  target  = "bootstrap/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "bootstrap",
  ]

  sha     = "h1:pCz5juYAeUbAkIhGUIixYeG3cFzkekBT+jIZ/UmmrBg="
  retries = 0
}

step "kube-init" {
  wkdir   = "bootstrap"
  target  = "bootstrap/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "0c2ec7cef4608d65c271dcfa8bc7a48e912abcd5d70ade49e10abe33d2c64a18"
  retries = 0
}

step "crds" {
  wkdir   = "bootstrap"
  target  = "bootstrap/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "bootstrap",
  ]

  sha     = "h1:xQTpOrcR+KWYsMyLe8viuBbY9C+HtBCWU2rHOiR3xTg="
  retries = 0
}

step "bounce" {
  wkdir   = "bootstrap"
  target  = "bootstrap/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "bootstrap",
  ]

  sha     = "h1:zWO2wUPsgOauenn1pFsewZ7L3rNOycbj4KE1qwZHsGo="
  retries = 1
}
