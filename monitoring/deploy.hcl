metadata {
  path = "monitoring"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:jE9O3EUMgw2ALMGa6RnhE4PT6xU/6LK9fr1AM0BrmBc="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:jE9O3EUMgw2ALMGa6RnhE4PT6xU/6LK9fr1AM0BrmBc="
  retries = 1
}

step "terraform-output" {
  wkdir   = "monitoring"
  target  = "monitoring/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
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
  ]

  sha     = "1eaf3068dcb12fab6c42567c0b4a34c33badfbf02fc6230db6e01dae94f649a5"
  retries = 0
}

step "crds" {
  wkdir   = "monitoring"
  target  = "monitoring/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "monitoring",
  ]

  sha     = "h1:WeO0sqSK8Yac5MD+k+wOlMrp+DVeHOhyIkDhM0HPKEA="
  retries = 0
}

step "bounce" {
  wkdir   = "monitoring"
  target  = "monitoring/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "monitoring",
  ]

  sha     = "h1:1rdQHy59FSZSVjDEVNlrwCTt9hrXCB1gegM9RpxEEio="
  retries = 1
}
