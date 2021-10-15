metadata {
  path = "console"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:iN0nHFvJfkOOnSMlMneUiLwbiK60fgxpD8+n35AMMH4="
  retries = 0
}

step "terraform" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "console",
  ]

  sha     = "h1:iN0nHFvJfkOOnSMlMneUiLwbiK60fgxpD8+n35AMMH4="
  retries = 0
}

step "kube-init" {
  wkdir   = "console"
  target  = "console/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "console",
  ]

  sha     = "d62bbb1b4a795f9a9153a0af295f5614e80d7451b40ea02d5cda83e225a399e8"
  retries = 0
}

step "helm" {
  wkdir   = "console/helm"
  target  = "console/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "console",
  ]

  sha     = "h1:2Eimzu6tlr7fAGrle99Cxgi4Xt//ao7Z2c/Df80ZS1E="
  retries = 0
}
