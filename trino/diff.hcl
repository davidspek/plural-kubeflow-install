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

  sha     = "5bba4a25ab5db1550e36bdd847d9c7afe4d9f1d1b0cd2de71cb959b9b506afb2"
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

  sha     = "h1:iRNqBwVHnvu5X/VeV81jlyo8Vjxlu3wJR/S8/n42ELA="
  retries = 0
  verbose = false
}
