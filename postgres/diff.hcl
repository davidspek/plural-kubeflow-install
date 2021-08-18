metadata {
  path = "postgres"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "postgres/terraform"
  target  = "postgres/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:w2qCi6sKpFLvyFlupLmEL0nLSuBEbkvg3um/CRLywpg="
}

step "terraform" {
  wkdir   = "postgres/terraform"
  target  = "postgres/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
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
    "postgres",
  ]

  sha = "7e68f9c6da08e4188d782d8951ff82ffb828fc3938156e0835a09bb15eb9d327"
}

step "helm" {
  wkdir   = "postgres/helm"
  target  = "postgres/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "postgres",
  ]

  sha = "h1:B/IJgDkIVIsvmmoZrjKAEO1RBZawsuAG1NCXiTgkBBg="
}
