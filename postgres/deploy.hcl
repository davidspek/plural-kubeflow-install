metadata {
  path = "postgres"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "postgres/terraform"
  target  = "postgres/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:wvfBW8Xg9MJFV5fVET1WcfGWb3fboMz/ZK9pjd7XG/E="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "postgres/terraform"
  target  = "postgres/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:wvfBW8Xg9MJFV5fVET1WcfGWb3fboMz/ZK9pjd7XG/E="
  retries = 1
}

step "terraform-output" {
  wkdir   = "postgres"
  target  = "postgres/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "postgres",
  ]

  sha     = "h1:wvfBW8Xg9MJFV5fVET1WcfGWb3fboMz/ZK9pjd7XG/E="
  retries = 0
}

step "kube-init" {
  wkdir   = "postgres"
  target  = "postgres/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "2a72e6cfda6680152aa4211690125178b4c819b4730ad65594f1a57185b2d3e5"
  retries = 0
}

step "crds" {
  wkdir   = "postgres"
  target  = "postgres/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "postgres",
  ]

  sha     = "h1:+KtpiGhaAg9Db5EdGawKjfUTQqpyrQFC87h9Gj2L/zQ="
  retries = 0
}

step "bounce" {
  wkdir   = "postgres"
  target  = "postgres/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "postgres",
  ]

  sha     = "h1:cPUtGKC4TmPML9Ci5V0IgSMUgPLp336d4IgUQ/S2qac="
  retries = 1
}
