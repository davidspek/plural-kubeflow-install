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

  sha     = "edc23706df226176aac1fad418041b79473e99ad136d5241553a29668c7a3b7d"
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

  sha     = "h1:BSCdyNt1cGPjGDL2w4OC23nbtvwPJ0I6yS4Gi5n20hc="
  retries = 1
}
