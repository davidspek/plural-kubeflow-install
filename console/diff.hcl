metadata {
  path = "console"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:IX3DaBSPu3q+ZAWa16N2xk5ybqS/ypqwC6gHi6Snxbg="
}

step "terraform" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "console",
  ]

  sha = "h1:IX3DaBSPu3q+ZAWa16N2xk5ybqS/ypqwC6gHi6Snxbg="
}

step "kube-init" {
  wkdir   = "console"
  target  = "console/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "console",
  ]

  sha = "d3b62e4497b215ded4c9f12279d66eaab2cb8d06a3224314cb48255f4c69c9d5"
}

step "helm" {
  wkdir   = "console/helm"
  target  = "console/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "console",
  ]

  sha = "h1:euy6zCk8dfW+9M8eFgTviXrsBmyvsk9GJstTw5ys0tc="
}
