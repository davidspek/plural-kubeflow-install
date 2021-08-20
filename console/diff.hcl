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

  sha = "b056bf2bf540a029e547e756155b6d6d42ac00e28596cb507cce6aacc1e31d59"
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

  sha = "h1:Eg0lJOiwuzO57QvupzYdqlwLMkbMle5oDLSDGd3Ffpc="
}
