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

  sha     = "a471586db1b6d1e3e6e7b14cfac64db425b3174ccf5000a7da0bc49a582a1df7"
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

  sha     = "h1:WnJM7HpiHqlGGJd4rN9LfwsUvd7kYYp6IxU+emzzaeo="
  retries = 0
}
