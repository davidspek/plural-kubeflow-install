metadata {
  path = "metabase"
  name = "deploy"
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

step "terraform-apply" {
  wkdir   = "metabase/terraform"
  target  = "metabase/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:EFbhPd0aTI0sDyDvVUcyzNgLD/GAqwyGn74m1HmkMis="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "metabase"
  target  = "metabase/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
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
  ]

  sha     = "43a201786d80e09b379d93fe40b6034f659ed6db28065e6bb89e6816e5121065"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "metabase"
  target  = "metabase/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "metabase",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "metabase"
  target  = "metabase/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "metabase",
  ]

  sha     = "h1:BqTKTYtexsFyNCoFiFE4Q4upAct5BWvcSPRsfhrLMzw="
  retries = 2
  verbose = false
}
