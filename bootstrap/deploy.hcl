metadata {
  path = "bootstrap"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:kFhm1QbBGAzFTc+zPqWJht0SVL6j929Bwe288wJ7euw="
}

step "terraform-apply" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha = "h1:kFhm1QbBGAzFTc+zPqWJht0SVL6j929Bwe288wJ7euw="
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

  sha = "h1:kFhm1QbBGAzFTc+zPqWJht0SVL6j929Bwe288wJ7euw="
}

step "kube-init" {
  wkdir   = "bootstrap"
  target  = "bootstrap/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha = "5714990f3ee50aa0e55fc4173efe8f5340097e0949dbc47910c6318907751cbc"
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

  sha = "h1:7FdY7EQzLud8Ibr90WeuMDc/WYeGqxdvj85wM+8PEBU="
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

  sha = "h1:k3zxd1NPd1rNmvuXz14jXrUsbIWIduGIR1um+YodA54="
}
