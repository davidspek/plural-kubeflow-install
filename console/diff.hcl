metadata {
  path = "console"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:eig6yptVpMRAeu/OieHOQM4IrRvH51VIC7gsN1+gCNk="
  retries = 0
  verbose = false
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

  sha     = "h1:eig6yptVpMRAeu/OieHOQM4IrRvH51VIC7gsN1+gCNk="
  retries = 0
  verbose = false
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

  sha     = "0f232ec3661ea2268f6dd88450283175407b1add449c42c8cfdd208f23d8f8b0"
  retries = 0
  verbose = false
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

  sha     = "h1:v1n9TrmmZa5mrIxB4QvEapSyZOsF1MP8xh2cfd0xUhk="
  retries = 0
  verbose = false
}
