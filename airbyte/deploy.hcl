metadata {
  path = "airbyte"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "airbyte/terraform"
  target  = "airbyte/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:BvrrVIrpy6Sl1ViUiwQlzLS7rRZpVyAP3AoLX2uJuas="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "airbyte/terraform"
  target  = "airbyte/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:BvrrVIrpy6Sl1ViUiwQlzLS7rRZpVyAP3AoLX2uJuas="
  retries = 1
}

step "terraform-output" {
  wkdir   = "airbyte"
  target  = "airbyte/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
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
  ]

  sha     = "a471586db1b6d1e3e6e7b14cfac64db425b3174ccf5000a7da0bc49a582a1df7"
  retries = 0
}

step "crds" {
  wkdir   = "airbyte"
  target  = "airbyte/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "airbyte",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
}

step "bounce" {
  wkdir   = "airbyte"
  target  = "airbyte/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "airbyte",
  ]

  sha     = "h1:WnJM7HpiHqlGGJd4rN9LfwsUvd7kYYp6IxU+emzzaeo="
  retries = 1
}
