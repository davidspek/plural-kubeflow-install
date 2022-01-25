metadata {
  path = "airbyte"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "airbyte/terraform"
  target  = "airbyte/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:BvrrVIrpy6Sl1ViUiwQlzLS7rRZpVyAP3AoLX2uJuas="
  retries = 0
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

  sha     = "h1:BvrrVIrpy6Sl1ViUiwQlzLS7rRZpVyAP3AoLX2uJuas="
  retries = 0
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

  sha     = "188e0f4bd19134d4b29bfd571f12b84793d33e3c589f89777395ec858729d4cb"
  retries = 0
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

  sha     = "h1:JxwmcU2p7WV1GUT7Q54TAELt27iYqgu0R/Uk83KIsZg="
  retries = 0
}
