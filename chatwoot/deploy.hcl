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

  sha     = "h1:8r/04K9vTOWHDVNaUMmMTK5t2PXzKjCqSNL6CU6XWkk="
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

  sha     = "h1:8r/04K9vTOWHDVNaUMmMTK5t2PXzKjCqSNL6CU6XWkk="
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

  sha     = "h1:8r/04K9vTOWHDVNaUMmMTK5t2PXzKjCqSNL6CU6XWkk="
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

  sha     = "86e9a5a8eaf6a2278e4017ad6bfd842ce523b43b166d35a5c3f7326bf81983b6"
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

  sha     = "h1:Cgy9kJscgvwuk/7XrTuI+4gtBrsTTE2zxG+f8csExTQ="
  retries = 2
  verbose = false
}
