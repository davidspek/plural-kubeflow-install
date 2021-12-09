metadata {
  path = "spark"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "spark/terraform"
  target  = "spark/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:U2QSHh+XWRpNif0vLvzY5GalCw8oVJ1JK6VOGDc9Fzg="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "spark/terraform"
  target  = "spark/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:U2QSHh+XWRpNif0vLvzY5GalCw8oVJ1JK6VOGDc9Fzg="
  retries = 1
}

step "terraform-output" {
  wkdir   = "spark"
  target  = "spark/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
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
  ]

  sha     = "5126144e569659fe2246f36c9144126c310ef54c19a027d29a985f3ff3678ffd"
  retries = 0
}

step "crds" {
  wkdir   = "spark"
  target  = "spark/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "spark",
  ]

  sha     = "h1:jLHHyrynCMz6i/CLZbNOyXgdM2ZQaS1hJwn+GHTHoyo="
  retries = 0
}

step "bounce" {
  wkdir   = "spark"
  target  = "spark/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "spark",
  ]

  sha     = "h1:U2aKGwgriPWhCskufxvs8Xo1GbJgkm1DS7INmPNud9M="
  retries = 1
}
