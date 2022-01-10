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

  sha     = "8b8fe2ca4c6c6e1a336132b49ff326e6ded0e5cb5fd2ab28f5f0a3a0c972984b"
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

  sha     = "h1:zraSgHD99pyv6lYcMQMFUj9ZAyzfdiJiq+N6jRCoMCI="
  retries = 0
}
