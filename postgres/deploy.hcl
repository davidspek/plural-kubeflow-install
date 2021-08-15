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

  sha = "42d999f28f0f014f01634350c18f94205ba2a5628c6a68252b1fdb1b1f291d9c"
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

  sha = "h1:Fu4NvXOyUELUC4m9Nxdq/+XN/EMgMBHPdYIbh0TCQ3g="
}
