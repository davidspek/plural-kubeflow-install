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

  sha     = "94e5eaee0838137adb7122b3c7d6db761a25159389393b44554a73e284f93bb0"
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

  sha     = "h1:WelcbCD2I13r6wTQC0/qPAZWC+SBVmgXhi1drQDsjcc="
  retries = 2
  verbose = false
}
