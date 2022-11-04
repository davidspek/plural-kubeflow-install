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

  sha     = "d421b4f600f2c5045cff8654d8c6d41feb89b9b1989c98ca54877b794572e098"
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

  sha     = "h1:Q+owUgWyMdKKOo+Jsy73jA1ZWb3Tk7AjsVEgJJ82aZs="
  retries = 2
  verbose = false
}
