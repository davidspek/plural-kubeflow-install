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

  sha     = "13c09578bafc87417cbc44f4eefb5e198d429223593fed2657866583ee47d9a8"
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

  sha     = "h1:qYNM4FX26uPnVSZ+oeh7zTPu3Xu5SW2X8nkmsW9WlXw="
  retries = 0
  verbose = false
}
