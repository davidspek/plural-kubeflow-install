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

  sha     = "h1:NRJhnmh/9N1aues5S1QTD/Fb/g3FSynb0QGMOUOelG4="
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

  sha     = "h1:NRJhnmh/9N1aues5S1QTD/Fb/g3FSynb0QGMOUOelG4="
  retries = 1
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

  sha     = "h1:NRJhnmh/9N1aues5S1QTD/Fb/g3FSynb0QGMOUOelG4="
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

  sha     = "b6331413797be352a99744bfbc2dbd061c47fcc89a3153835a838654c3b8cb14"
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

  sha     = "h1:2O/tyKpBLDl7SECNKsFeOHeetmUaDDBXJnqZwfGrLAs="
  retries = 1
  verbose = false
}
