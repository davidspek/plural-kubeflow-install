metadata {
  path = "kserve"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "kserve/terraform"
  target  = "kserve/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = ""
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "kserve/terraform"
  target  = "kserve/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "kserve",
  ]

  sha     = ""
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "kserve"
  target  = "kserve/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "kserve",
  ]

  sha     = ""
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "kserve/helm"
  target  = "kserve/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "kserve",
  ]

  sha     = ""
  retries = 0
  verbose = false
}
