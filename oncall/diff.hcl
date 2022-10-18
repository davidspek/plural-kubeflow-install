metadata {
  path = "oncall"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "oncall/terraform"
  target  = "oncall/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = ""
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "oncall/terraform"
  target  = "oncall/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "oncall",
  ]

  sha     = ""
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "oncall"
  target  = "oncall/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "oncall",
  ]

  sha     = ""
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "oncall/helm"
  target  = "oncall/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "oncall",
  ]

  sha     = ""
  retries = 0
  verbose = false
}
