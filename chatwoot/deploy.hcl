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

  sha     = "h1:OWBs+tXlhX+u5d+DzZeLy4jgUC0VFjge58R1hch6JWY="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "chatwoot/terraform"
  target  = "chatwoot/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:OWBs+tXlhX+u5d+DzZeLy4jgUC0VFjge58R1hch6JWY="
  retries = 1
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

  sha     = "h1:OWBs+tXlhX+u5d+DzZeLy4jgUC0VFjge58R1hch6JWY="
  retries = 0
}

step "kube-init" {
  wkdir   = "chatwoot"
  target  = "chatwoot/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "afb64f40879208e43b9dd69eeec53eaea9bf1d8a289b00dcbee9b7bfc00b159e"
  retries = 0
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

  sha     = "h1:N1ostTkhppEoxBEkrEVfKvMFAILNGv8bVJMfDT+saDs="
  retries = 1
}
