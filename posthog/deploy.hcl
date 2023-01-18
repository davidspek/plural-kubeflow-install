metadata {
  path = "posthog"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "posthog/terraform"
  target  = "posthog/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:RVlgMxntO3NFjWFIxwtuRIR10w52FG0csriQEQGhizo="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "posthog/terraform"
  target  = "posthog/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:RVlgMxntO3NFjWFIxwtuRIR10w52FG0csriQEQGhizo="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "posthog"
  target  = "posthog/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "posthog",
  ]

  sha     = "h1:RVlgMxntO3NFjWFIxwtuRIR10w52FG0csriQEQGhizo="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "posthog"
  target  = "posthog/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "23e7d126372aa3cd3780f545e0569917a1bd94cc3b4b9486f80eb450eea9d7c7"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "posthog"
  target  = "posthog/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "posthog",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "posthog"
  target  = "posthog/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "posthog",
  ]

  sha     = "h1:/wC2Aii7/QHt/3N5AteQs9JbjyqgMJQe0LaISpr1lwE="
  retries = 2
  verbose = false
}
