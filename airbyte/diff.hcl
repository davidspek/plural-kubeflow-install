metadata {
  path = "airbyte"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "airbyte/terraform"
  target  = "airbyte/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:E5KTqdQzIh5BSRX1hW2EOVA0E/RGGe5iQSCe3ELZdew="
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

  sha     = "h1:E5KTqdQzIh5BSRX1hW2EOVA0E/RGGe5iQSCe3ELZdew="
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

  sha     = "b0fee00ec82036e916a7e7333ebcf73b1c5379c96c4e5551a93b561c522b834c"
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

  sha     = "h1:j+YWv7uoQ2dWS9x9xwlc4gZsF2YWBx07Yc5zGou0tjM="
  retries = 0
}
