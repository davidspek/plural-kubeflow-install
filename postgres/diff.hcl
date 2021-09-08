metadata {
  path = "postgres"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "postgres/terraform"
  target  = "postgres/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:e38kvNDKB2IugiiHQjMEvNOi6o6r4J3xI1MJB1FKy/U="
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

  sha = "h1:e38kvNDKB2IugiiHQjMEvNOi6o6r4J3xI1MJB1FKy/U="
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

  sha = "97e5ed53f593f2f05346f514a2c2770b2b9bac866ad1dab8e90a01fa0141b9e9"
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

  sha = "h1:4uZntiYHcBU39AGoLqBTyBIiQhusgT7hd43+m5yScT4="
}
