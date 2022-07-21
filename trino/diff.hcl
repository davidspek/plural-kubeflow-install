metadata {
  path = "trino"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "trino/terraform"
  target  = "trino/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:ia0EfV4FYV+vwdyykIsreqOIOnpMEpm7t/NgnKbuMa8="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "trino/terraform"
  target  = "trino/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "trino",
  ]

  sha     = "h1:ia0EfV4FYV+vwdyykIsreqOIOnpMEpm7t/NgnKbuMa8="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "trino"
  target  = "trino/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "trino",
  ]

  sha     = "d6a370151870aff7f33cda4b1e1836364b9145773d669bbef35b38880926259d"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "trino/helm"
  target  = "trino/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "trino",
  ]

  sha     = "h1:Je6Ogfca1A3/V3MlgBgT7vlRehV3NDMnZ3yaHNbGMNA="
  retries = 0
  verbose = false
}
