metadata {
  path = "sentry"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "sentry/terraform"
  target  = "sentry/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:eF4JNuujFGE/2IXI8sYSz/oaZV2cG3mvmrLpUF5VIis="
}

step "terraform" {
  wkdir   = "sentry/terraform"
  target  = "sentry/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
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
    "sentry",
  ]

  sha = "63edacda6ef74d6fc67c54787ad6a8b7e43d5570fe9c99b2cb37989818b0816c"
}

step "helm" {
  wkdir   = "sentry/helm"
  target  = "sentry/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "sentry",
  ]

  sha = "h1:nu1F6pudndR/jCxWlaVskOKixB3b58ANFLV942KrXn4="
}
