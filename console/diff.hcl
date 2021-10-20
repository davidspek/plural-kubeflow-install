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

  sha     = "5eb1890de1caaf19cf4971a02c8f58bc8d5e8dce81138ff1b51340af36737a8b"
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

  sha     = "h1:0Vhoz4P7YA05hkDr26wGfSotSa0ZSpLbx6x5j61CZLk="
  retries = 0
}
