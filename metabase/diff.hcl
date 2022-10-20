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

  sha     = "2c0c136ccea5bbee2785600bcd8d21e5131dde3226d4fd7757ca4e5e5aa4f22c"
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

  sha     = "h1:CZi11YrGkDgmjR6W3Ndb0/jcRlSVzeXsOtwTuZE0PAY="
  retries = 0
  verbose = false
}
