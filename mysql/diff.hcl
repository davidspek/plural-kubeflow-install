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

  sha = "29771fbb231c897156c0bd0e84325f22fd97cc5cbee4571f0d6b0ddfe8a25388"
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

  sha = "h1:ES20q5l4UCGAC2KuPY1iSGzVGxQCXyOMmvnp5IAXu1k="
}
