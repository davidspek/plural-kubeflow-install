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

  sha     = "h1:M2iGFYcoTWKE8jwIZX33o+wjcfB3q6chE0VhMNy+I3s="
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

  sha     = "h1:M2iGFYcoTWKE8jwIZX33o+wjcfB3q6chE0VhMNy+I3s="
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

  sha     = "h1:M2iGFYcoTWKE8jwIZX33o+wjcfB3q6chE0VhMNy+I3s="
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

  sha     = "4378e987ee156a10781e9de15ac9f19c1d044afa42ef4918e1462efcd084dfdb"
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

  sha     = "h1:UCg4QS0AfXNDZ4UvpS353xvI+XwDZ+7dorKJ8MQxB6E="
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

  sha     = "h1:JZFPNYuFbu3p7qYwm6q9xFZvcsl8gOqLF5DUlBkn36s="
  retries = 1
}
