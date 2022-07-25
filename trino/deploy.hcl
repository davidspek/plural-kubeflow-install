metadata {
  path = "trino"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "trino/terraform"
  target  = "trino/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:ia0EfV4FYV+vwdyykIsreqOIOnpMEpm7t/NgnKbuMa8="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "trino/terraform"
  target  = "trino/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:ia0EfV4FYV+vwdyykIsreqOIOnpMEpm7t/NgnKbuMa8="
  retries = 1
  verbose = false
}

step "terraform-output" {
  wkdir   = "trino"
  target  = "trino/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
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
  ]

  sha     = "13c09578bafc87417cbc44f4eefb5e198d429223593fed2657866583ee47d9a8"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "trino"
  target  = "trino/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "trino",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "trino"
  target  = "trino/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "trino",
  ]

  sha     = "h1:qYNM4FX26uPnVSZ+oeh7zTPu3Xu5SW2X8nkmsW9WlXw="
  retries = 1
  verbose = false
}
