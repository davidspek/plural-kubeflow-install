metadata {
  path = "crossplane"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "crossplane/terraform"
  target  = "crossplane/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:hEGp/MblTNve9EAwqdcWwdphkcagnNwNqWla9Pvwx1E="
  retries = 0
}

step "terraform" {
  wkdir   = "crossplane/terraform"
  target  = "crossplane/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "crossplane",
  ]

  sha     = "h1:hEGp/MblTNve9EAwqdcWwdphkcagnNwNqWla9Pvwx1E="
  retries = 0
}

step "kube-init" {
  wkdir   = "crossplane"
  target  = "crossplane/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "crossplane",
  ]

  sha     = "638b9fb50923627cc7ea29aecee3e65b7081839268a9b086c6f19418abad2caa"
  retries = 0
}

step "helm" {
  wkdir   = "crossplane/helm"
  target  = "crossplane/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "crossplane",
  ]

  sha     = "h1:XF3Ea5+PezHBtDhq9VILxNtWdDcVwsacydev1Lo7IGI="
  retries = 0
}
