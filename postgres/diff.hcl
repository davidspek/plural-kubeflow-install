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

  sha = "c9e4d5d4f2f4c274b9240ec026726d571bebda40a533529a7ebd7717fc2c5afc"
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

  sha = "h1:dDXXO+4ynsfwaQX3uX0w+M2XsS6BKLvnuW6jmlPRszo="
}
