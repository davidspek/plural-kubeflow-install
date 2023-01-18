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

  sha     = "914a3968dfc192ad68803bbbfd4c654d94b63bbcd6d4f2ec9fdb8eecdf5b104d"
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

  sha     = "h1:AKKrq0kiz9oKBgvRafFT043BC3pVgvC5q2FKvpxV89w="
  retries = 2
  verbose = false
}
