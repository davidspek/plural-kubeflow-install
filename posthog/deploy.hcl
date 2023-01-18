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

  sha     = "6b5c29f60ef6278e945fef8cd05440b9e9f03b732da1adf9ba6d8d3a4c26af81"
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

  sha     = "h1:p8jV7O89jOnAUlbsE++YV65LgQjkjtOrPO0v5GAjg10="
  retries = 2
  verbose = false
}
