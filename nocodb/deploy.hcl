metadata {
  path = "nocodb"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "nocodb/terraform"
  target  = "nocodb/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:78En4+21QdkiL/H2+RVVj+wut6XF4qfQw5Ubu5vs3iE="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "nocodb/terraform"
  target  = "nocodb/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:78En4+21QdkiL/H2+RVVj+wut6XF4qfQw5Ubu5vs3iE="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "nocodb"
  target  = "nocodb/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "nocodb",
  ]

  sha     = "h1:78En4+21QdkiL/H2+RVVj+wut6XF4qfQw5Ubu5vs3iE="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "nocodb"
  target  = "nocodb/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "680235b20dcf40a8a83d8780a1d9c52dd56122be921b1134e68545a4f8b91343"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "nocodb"
  target  = "nocodb/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "nocodb",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "nocodb"
  target  = "nocodb/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "nocodb",
  ]

  sha     = "h1:T0M3EgwxFWNkrSjxQlW9sBWzXBNU3TzBqV3fyRvK6t4="
  retries = 2
  verbose = false
}
