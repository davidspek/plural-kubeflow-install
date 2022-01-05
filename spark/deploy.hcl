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

  sha     = "90d9d23729a383efb19d4aad4943741193800005f42e489891c2a2e98cad7e92"
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

  sha     = "h1:zVd+nQwh8rQveaZ9ZiY8y/4JgOD8wPEJkjeX8eijxM0="
  retries = 1
}
