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
  retries = 0
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

  sha     = "h1:UnzP3b5lg3Ew1FvXmwdiwdhSQd5G6XXiQLHCELQPZfs="
  retries = 0
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

  sha     = "450a68a5eef923c50600b4b4842e3aaa2153442b05e87bce7cc6e961cf87a6b8"
  retries = 0
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

  sha     = "h1:Wh4JZub2lSnSmwSHbLCU+/eGMREsEqZ46u/jZmXq260="
  retries = 0
}
