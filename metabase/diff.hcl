metadata {
  path = "metabase"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "metabase/terraform"
  target  = "metabase/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

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

  sha     = "6cfcae84eccaed8e7259438c9afb49e2de86237ca3760937922501d57083f4a1"
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

  sha     = "h1:uFKLCSgRUqNE5oECPvWttP8gSxt3fNf0zQ/fm7pjBpA="
  retries = 0
  verbose = false
}
