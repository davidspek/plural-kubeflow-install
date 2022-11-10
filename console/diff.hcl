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

  sha     = "363b87fb9a628465c5dfb96b7e78631e3ee897b801e0c692ab0a01f4691fd13e"
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

  sha     = "h1:zkCv3lEkEBADsgIT335fwvXUtxMkHuQQQFiR5cX4HtU="
  retries = 0
  verbose = false
}
