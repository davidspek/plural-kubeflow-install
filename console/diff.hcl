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

  sha     = "c7d572847ecb24a71d1148d0e16b6c76ea0ee4cb9c88096a4aa7a819e89c2b25"
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

  sha     = "h1:903EUDSCCdD1M6SawJjOHqajUNRLwj5btKOvetVhKvc="
  retries = 0
}
