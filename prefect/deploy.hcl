metadata {
  path = "prefect"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "prefect/terraform"
  target  = "prefect/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:lIiH0wFhr7RsSeoNmvOYDvLrGgsETw2YkqyDR9XAf8Y="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "prefect/terraform"
  target  = "prefect/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:lIiH0wFhr7RsSeoNmvOYDvLrGgsETw2YkqyDR9XAf8Y="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "prefect"
  target  = "prefect/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "prefect",
  ]

  sha     = "h1:lIiH0wFhr7RsSeoNmvOYDvLrGgsETw2YkqyDR9XAf8Y="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "prefect"
  target  = "prefect/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "73eff0b4f3e24f400e81675744d5c24516b2ba4b3d14ad9ca6b1f22873fb835d"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "prefect"
  target  = "prefect/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "prefect",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "prefect"
  target  = "prefect/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "prefect",
  ]

  sha     = "h1:n4bW5lKXAi8+j9RONDXxhCOcem04U8hlndKtiFUIxvU="
  retries = 2
  verbose = false
}
