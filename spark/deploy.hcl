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

  sha     = "be4875087dd907c501521b547a55a318196e495510bd6db9dbfc559fda24abe2"
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

  sha     = "h1:7Q99mN3merij/6fQ227YujEIKrGicbUsgNBWugEtX08="
  retries = 1
}
