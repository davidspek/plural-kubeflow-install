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

  sha     = "h1:uKzw3RWhM1NhVfFxkJdB/uz7Bm+w4fI4BhGtMu3PcaI="
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

  sha     = "h1:uKzw3RWhM1NhVfFxkJdB/uz7Bm+w4fI4BhGtMu3PcaI="
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

  sha     = "h1:uKzw3RWhM1NhVfFxkJdB/uz7Bm+w4fI4BhGtMu3PcaI="
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

  sha     = "bf72888aa42eb7ccc73d129e4bfd0f42c6537d9c62681ec9df04cc5730a64092"
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

  sha     = "h1:iQ7W6qI2ks1njRDSnqFmXYywWNGOPd/TPiV0JAFlmeg="
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

  sha     = "h1:RN/olGlQuQGlKs82ieQzQakJSqS764zRwPlQtS+/hV0="
  retries = 1
}
