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

  sha     = "2c0c136ccea5bbee2785600bcd8d21e5131dde3226d4fd7757ca4e5e5aa4f22c"
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

  sha     = "h1:CZi11YrGkDgmjR6W3Ndb0/jcRlSVzeXsOtwTuZE0PAY="
  retries = 2
  verbose = false
}
