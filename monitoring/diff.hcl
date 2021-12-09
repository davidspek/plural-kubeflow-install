metadata {
  path = "monitoring"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:jE9O3EUMgw2ALMGa6RnhE4PT6xU/6LK9fr1AM0BrmBc="
  retries = 0
}

step "terraform" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "monitoring",
  ]

  sha     = "h1:jE9O3EUMgw2ALMGa6RnhE4PT6xU/6LK9fr1AM0BrmBc="
  retries = 0
}

step "kube-init" {
  wkdir   = "monitoring"
  target  = "monitoring/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "monitoring",
  ]

  sha     = "218c86e2947e6046d0fbe1710b909473b03b3cefe613fa5d527c18698fa3ff17"
  retries = 0
}

step "helm" {
  wkdir   = "monitoring/helm"
  target  = "monitoring/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "monitoring",
  ]

  sha     = "h1:4J4IQp0zjToB84f/LJg1lxuDeVDBo+DZKDj9+m1/x7w="
  retries = 0
}
