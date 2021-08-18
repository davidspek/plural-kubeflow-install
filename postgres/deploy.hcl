metadata {
  path = "postgres"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "postgres/terraform"
  target  = "postgres/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:w2qCi6sKpFLvyFlupLmEL0nLSuBEbkvg3um/CRLywpg="
}

step "terraform-apply" {
  wkdir   = "postgres/terraform"
  target  = "postgres/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha = "h1:w2qCi6sKpFLvyFlupLmEL0nLSuBEbkvg3um/CRLywpg="
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

  sha = "h1:w2qCi6sKpFLvyFlupLmEL0nLSuBEbkvg3um/CRLywpg="
}

step "kube-init" {
  wkdir   = "postgres"
  target  = "postgres/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha = "7e68f9c6da08e4188d782d8951ff82ffb828fc3938156e0835a09bb15eb9d327"
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

  sha = "h1:+KtpiGhaAg9Db5EdGawKjfUTQqpyrQFC87h9Gj2L/zQ="
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

  sha = "h1:B/IJgDkIVIsvmmoZrjKAEO1RBZawsuAG1NCXiTgkBBg="
}
