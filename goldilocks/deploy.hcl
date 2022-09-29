metadata {
  path = "goldilocks"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "goldilocks/terraform"
  target  = "goldilocks/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:zcvbUrPgWlStBma0dPV1HcA4dfkjfHqSpz+Y/32gCNU="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "goldilocks/terraform"
  target  = "goldilocks/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:zcvbUrPgWlStBma0dPV1HcA4dfkjfHqSpz+Y/32gCNU="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "goldilocks"
  target  = "goldilocks/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "goldilocks",
  ]

  sha     = "h1:zcvbUrPgWlStBma0dPV1HcA4dfkjfHqSpz+Y/32gCNU="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "goldilocks"
  target  = "goldilocks/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "109a53e7e525595582b912d4be96f41153ef84ce41a4a5e2cd4b245fb252b646"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "goldilocks"
  target  = "goldilocks/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "goldilocks",
  ]

  sha     = "h1:H4a+KYlIqROhiD54T8DO+u8GcPZMGnmdxVjHY5QqobM="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "goldilocks"
  target  = "goldilocks/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "goldilocks",
  ]

  sha     = "h1:WIctdwrsg7f3bGbN5N8JngxKyvHcNy6pIFW4l/c84nQ="
  retries = 2
  verbose = false
}
