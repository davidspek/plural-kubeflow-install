metadata {
  path = "console"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:rK1DLFkq14Pxq9RtoRBwjrUa8mSmv8DQyt0Gsrm+5/8="
  retries = 0
}

step "terraform" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "console",
  ]

  sha     = "h1:rK1DLFkq14Pxq9RtoRBwjrUa8mSmv8DQyt0Gsrm+5/8="
  retries = 0
}

step "kube-init" {
  wkdir   = "console"
  target  = "console/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "console",
  ]

  sha     = "f09cd35a155ca161374dceebbedd59241d34f05695b700d81d0cb4272e1fb4da"
  retries = 0
}

step "helm" {
  wkdir   = "console/helm"
  target  = "console/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "console",
  ]

  sha     = "h1:gtCor6lIDlc9+AFlAn086U1W7jNl6+CGlYVUKZazGF8="
  retries = 0
}
