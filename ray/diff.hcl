metadata {
  path = "ray"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "ray/terraform"
  target  = "ray/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:ngeG7vc/06AfpVBxX0CpVHrIiVTC0EcD9pAreejanuo="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "ray/terraform"
  target  = "ray/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "ray",
  ]

  sha     = "h1:ngeG7vc/06AfpVBxX0CpVHrIiVTC0EcD9pAreejanuo="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "ray"
  target  = "ray/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "ray",
  ]

  sha     = "9d2249adc8d994ddc3ab790c4260bc620d4ceb5bb9c6ea7babc5bffb93a41ac4"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "ray/helm"
  target  = "ray/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "ray",
  ]

  sha     = "h1:PoB4NwPp4azdShVrfzZFKveVwBRuud7JV87GoW1NGUI="
  retries = 0
  verbose = false
}
