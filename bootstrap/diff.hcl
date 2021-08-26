metadata {
  path = "bootstrap"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:kFhm1QbBGAzFTc+zPqWJht0SVL6j929Bwe288wJ7euw="
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

  sha = "h1:kFhm1QbBGAzFTc+zPqWJht0SVL6j929Bwe288wJ7euw="
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

  sha = "5714990f3ee50aa0e55fc4173efe8f5340097e0949dbc47910c6318907751cbc"
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

  sha = "h1:k3zxd1NPd1rNmvuXz14jXrUsbIWIduGIR1um+YodA54="
}
