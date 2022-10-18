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

  sha     = "d138de2e4a9b956028a6ace0997c1e491fe83373e0efd3079e7222f4e00226d4"
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

  sha     = "h1:+5MEyzVHkjnLMnru/iufbY0XYkFIA1skgyitV6eWL9c="
  retries = 0
  verbose = false
}
