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

  sha     = "5ca2c0cd72c4bef1d7ecf706f24c1583c77b6048f41046fc8c28f56715067009"
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

  sha     = "h1:+S7w/vZNRoJPsn+HKUIJ+6wA/QfTn7FnARvyN+E2aD0="
  retries = 0
}
