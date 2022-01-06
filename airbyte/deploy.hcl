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

  sha     = "h1:E5KTqdQzIh5BSRX1hW2EOVA0E/RGGe5iQSCe3ELZdew="
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

  sha     = "h1:E5KTqdQzIh5BSRX1hW2EOVA0E/RGGe5iQSCe3ELZdew="
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
  ]

  sha     = "b0fee00ec82036e916a7e7333ebcf73b1c5379c96c4e5551a93b561c522b834c"
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

  sha     = "h1:j+YWv7uoQ2dWS9x9xwlc4gZsF2YWBx07Yc5zGou0tjM="
  retries = 1
}
