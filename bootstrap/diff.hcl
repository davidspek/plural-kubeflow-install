metadata {
  path = "bootstrap"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:pCz5juYAeUbAkIhGUIixYeG3cFzkekBT+jIZ/UmmrBg="
  retries = 0
}

step "terraform" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
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
    "bootstrap",
  ]

  sha     = "0c2ec7cef4608d65c271dcfa8bc7a48e912abcd5d70ade49e10abe33d2c64a18"
  retries = 0
}

step "helm" {
  wkdir   = "bootstrap/helm"
  target  = "bootstrap/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "bootstrap",
  ]

  sha     = "h1:zWO2wUPsgOauenn1pFsewZ7L3rNOycbj4KE1qwZHsGo="
  retries = 0
}
