metadata {
  path = "spark"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "spark/terraform"
  target  = "spark/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:U2QSHh+XWRpNif0vLvzY5GalCw8oVJ1JK6VOGDc9Fzg="
  retries = 0
}

step "terraform" {
  wkdir   = "spark/terraform"
  target  = "spark/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "spark",
  ]

  sha     = "h1:U2QSHh+XWRpNif0vLvzY5GalCw8oVJ1JK6VOGDc9Fzg="
  retries = 0
}

step "kube-init" {
  wkdir   = "spark"
  target  = "spark/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "spark",
  ]

  sha     = "5126144e569659fe2246f36c9144126c310ef54c19a027d29a985f3ff3678ffd"
  retries = 0
}

step "helm" {
  wkdir   = "spark/helm"
  target  = "spark/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "spark",
  ]

  sha     = "h1:U2aKGwgriPWhCskufxvs8Xo1GbJgkm1DS7INmPNud9M="
  retries = 0
}
