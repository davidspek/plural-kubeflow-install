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

  sha     = "c023497da258167744f564918d7268d6ebaf4e572092362487a9f17f4c0b22be"
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

  sha     = "h1:OExdo4SlNNB5QshvolnVLEmHuLy0zzizibYJk36xEz0="
  retries = 2
  verbose = false
}
