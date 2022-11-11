metadata {
  path = "airbyte"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "airbyte/terraform"
  target  = "airbyte/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:ed8swfaAFPgAsnPKxNAdZN9NQBPmCvjVN8sgv6u8fko="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "airbyte/terraform"
  target  = "airbyte/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "airbyte",
  ]

  sha     = "h1:ed8swfaAFPgAsnPKxNAdZN9NQBPmCvjVN8sgv6u8fko="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "airbyte"
  target  = "airbyte/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "airbyte",
  ]

  sha     = "eb7e4734f4f5e66aa9912639d2973e292b26cf82600f8aaf0805f34395e3f24e"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "airbyte/helm"
  target  = "airbyte/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "airbyte",
  ]

  sha     = "h1:TFFgnCZuu/qFLZYJBzbhFv/DtRiOcsr57NEM/rDwx1A="
  retries = 0
  verbose = false
}
