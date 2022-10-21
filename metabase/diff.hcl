metadata {
  path = "metabase"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "metabase/terraform"
  target  = "metabase/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:EFbhPd0aTI0sDyDvVUcyzNgLD/GAqwyGn74m1HmkMis="
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

  sha     = "h1:EFbhPd0aTI0sDyDvVUcyzNgLD/GAqwyGn74m1HmkMis="
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

  sha     = "87ecc4613262dcded84ae7ef6605ca4c552c4610b88630e66e199dcb0ad153f2"
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

  sha     = "h1:EhgL9IzVsxER7uqri1PdPaJmnyE0oYEsJV7mFFxy90A="
  retries = 0
  verbose = false
}
