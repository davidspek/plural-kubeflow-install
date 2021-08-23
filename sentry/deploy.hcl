metadata {
  path = "sentry"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "sentry/terraform"
  target  = "sentry/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:eF4JNuujFGE/2IXI8sYSz/oaZV2cG3mvmrLpUF5VIis="
}

step "terraform-apply" {
  wkdir   = "sentry/terraform"
  target  = "sentry/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha = "h1:eF4JNuujFGE/2IXI8sYSz/oaZV2cG3mvmrLpUF5VIis="
}

step "terraform-output" {
  wkdir   = "sentry"
  target  = "sentry/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "sentry",
  ]

  sha = "h1:eF4JNuujFGE/2IXI8sYSz/oaZV2cG3mvmrLpUF5VIis="
}

step "kube-init" {
  wkdir   = "sentry"
  target  = "sentry/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha = "63edacda6ef74d6fc67c54787ad6a8b7e43d5570fe9c99b2cb37989818b0816c"
}

step "crds" {
  wkdir   = "sentry"
  target  = "sentry/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "sentry",
  ]

  sha = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
}

step "bounce" {
  wkdir   = "sentry"
  target  = "sentry/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "sentry",
  ]

  sha = "h1:nu1F6pudndR/jCxWlaVskOKixB3b58ANFLV942KrXn4="
}
