metadata {
  path = "external-secrets"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "external-secrets/terraform"
  target  = "external-secrets/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:fOydVpkwf+onOoVTgc3XqoQBAnrvpLTJr9lVyQ/lZNI="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "external-secrets/terraform"
  target  = "external-secrets/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:fOydVpkwf+onOoVTgc3XqoQBAnrvpLTJr9lVyQ/lZNI="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "external-secrets"
  target  = "external-secrets/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "external-secrets",
  ]

  sha     = "h1:fOydVpkwf+onOoVTgc3XqoQBAnrvpLTJr9lVyQ/lZNI="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "external-secrets"
  target  = "external-secrets/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "4f9ca32c75fc23c7e9c188a09dcc6d760f90f360c040ac40de667c66c630e099"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "external-secrets"
  target  = "external-secrets/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "external-secrets",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "external-secrets"
  target  = "external-secrets/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "external-secrets",
  ]

  sha     = "h1:qwS1EfiPkNbqgP96sUeqAgGhIwWuI3k2Jp8v1VcPnls="
  retries = 2
  verbose = false
}
