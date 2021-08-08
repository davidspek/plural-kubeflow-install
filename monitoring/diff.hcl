metadata {
  path = "monitoring"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:UnzP3b5lg3Ew1FvXmwdiwdhSQd5G6XXiQLHCELQPZfs="
}

step "terraform" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "monitoring",
  ]

  sha = "h1:UnzP3b5lg3Ew1FvXmwdiwdhSQd5G6XXiQLHCELQPZfs="
}

step "kube-init" {
  wkdir   = "monitoring"
  target  = "monitoring/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "monitoring",
  ]

  sha = "aeb9aba9666d3bf1c7aa66fb1df2cde55983db3933af7eb93e9bc3c2a256a37b"
}

step "helm" {
  wkdir   = "monitoring/helm"
  target  = "monitoring/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "monitoring",
  ]

  sha = "h1:D1YW4dyv+KI4Jv/eAZazAn6UZeQH6oKLP1ePggpF4nY="
}
