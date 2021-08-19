metadata {
  path = "mysql"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "mysql/terraform"
  target  = "mysql/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:L4htGAkRrYRcQhfqAdgQViPIWJYecm5RFWz2JoG6bUM="
}

step "terraform-apply" {
  wkdir   = "mysql/terraform"
  target  = "mysql/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha = "h1:L4htGAkRrYRcQhfqAdgQViPIWJYecm5RFWz2JoG6bUM="
}

step "terraform-output" {
  wkdir   = "mysql"
  target  = "mysql/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
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
  ]

  sha = "5924751c1c84ce7d65ece9ac54baf030e8c721f96f8d9b0b4d43fae24da841d4"
}

step "crds" {
  wkdir   = "mysql"
  target  = "mysql/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "mysql",
  ]

  sha = "h1:044S1+ptG9zyrB8p0LDMQZMd1vTbGQUBUKL3EGBPN5A="
}

step "bounce" {
  wkdir   = "mysql"
  target  = "mysql/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "mysql",
  ]

  sha = "h1:7ufMqaVUgaN4TDTAmpFjfPzNLhmVrB+i864+i4cAdGs="
}
