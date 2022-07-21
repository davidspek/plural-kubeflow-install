metadata {
  path = "metabase"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "metabase/terraform"
  target  = "metabase/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = ""
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "metabase/terraform"
  target  = "metabase/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "metabase",
  ]

  sha     = ""
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "metabase"
  target  = "metabase/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "metabase",
  ]

  sha     = ""
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "metabase/helm"
  target  = "metabase/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "metabase",
  ]

  sha     = ""
  retries = 0
  verbose = false
}
