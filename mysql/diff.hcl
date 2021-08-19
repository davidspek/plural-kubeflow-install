metadata {
  path = "mysql"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "mysql/terraform"
  target  = "mysql/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:L4htGAkRrYRcQhfqAdgQViPIWJYecm5RFWz2JoG6bUM="
}

step "terraform" {
  wkdir   = "mysql/terraform"
  target  = "mysql/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "mysql",
  ]

  sha = "h1:L4htGAkRrYRcQhfqAdgQViPIWJYecm5RFWz2JoG6bUM="
}

step "kube-init" {
  wkdir   = "mysql"
  target  = "mysql/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "mysql",
  ]

  sha = "3b805b732d4c827983e3acc1ba353a6cf907e115f00cd84b4b711d758ddcc355"
}

step "helm" {
  wkdir   = "mysql/helm"
  target  = "mysql/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "mysql",
  ]

  sha = "h1:7ufMqaVUgaN4TDTAmpFjfPzNLhmVrB+i864+i4cAdGs="
}
