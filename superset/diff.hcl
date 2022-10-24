metadata {
  path = "superset"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "superset/terraform"
  target  = "superset/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = ""
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "superset/terraform"
  target  = "superset/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "superset",
  ]

  sha     = ""
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "superset"
  target  = "superset/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "superset",
  ]

  sha     = ""
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "superset/helm"
  target  = "superset/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "superset",
  ]

  sha     = ""
  retries = 0
  verbose = false
}
