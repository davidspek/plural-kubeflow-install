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

  sha     = "h1:rrF3Ix89Xo2tYKfZmxFZFXJrXEPjKKyLsLU1uLAkiwM="
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

  sha     = "h1:rrF3Ix89Xo2tYKfZmxFZFXJrXEPjKKyLsLU1uLAkiwM="
  retries = 2
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

  sha     = "h1:rrF3Ix89Xo2tYKfZmxFZFXJrXEPjKKyLsLU1uLAkiwM="
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

  sha     = "3460b91cdde8e98a9262fa854473f81556ef1f99b022761bd7c0d7f10ccb5121"
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

  sha     = "h1:ALtSpihgHh/FmoFeyju9wOerR9yhNXov59MCAQSqh70="
  retries = 2
  verbose = false
}
