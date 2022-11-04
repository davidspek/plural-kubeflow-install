metadata {
  path = "chatwoot"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "chatwoot/terraform"
  target  = "chatwoot/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:Dt5RVeN7bHhGEvJW1jMMwHzwQ8tK7n3SEyQzg7FPg3c="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "chatwoot/terraform"
  target  = "chatwoot/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:Dt5RVeN7bHhGEvJW1jMMwHzwQ8tK7n3SEyQzg7FPg3c="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "chatwoot"
  target  = "chatwoot/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "chatwoot",
  ]

  sha     = "h1:Dt5RVeN7bHhGEvJW1jMMwHzwQ8tK7n3SEyQzg7FPg3c="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "chatwoot"
  target  = "chatwoot/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "130a95b9f7ad287a6092e17cffd9de2e50c805aa78d8bbbc50d391902225f9ab"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "chatwoot"
  target  = "chatwoot/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "chatwoot",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "chatwoot"
  target  = "chatwoot/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "chatwoot",
  ]

  sha     = "h1:iTBKQjbsW+KrQ/j5LVhcb9w0FoUFWIPJ5rmI8TSZGO0="
  retries = 2
  verbose = false
}
