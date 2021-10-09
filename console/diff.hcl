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

  sha     = "774e0e408b2c8ebb0263d8fed460710c6847885d789d0da648c83c986ff9ff4a"
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

  sha     = "h1:fyjG6XV9wgkgtCQEMNlQp+MuP3pIFykXCZ2aHlX5L/w="
  retries = 0
}
