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

  sha = "77ef048daae778cbc3adefdc579b63374219abed853bc236bc9775dc70fcbcd1"
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

  sha = "h1:I0T8fCrLA5b6IwCGuOrw1Oz1nkV3Zhp4AGkKMujee8A="
}
