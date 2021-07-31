metadata {
  path = "console"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:IX3DaBSPu3q+ZAWa16N2xk5ybqS/ypqwC6gHi6Snxbg="
}

step "terraform-apply" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha = "h1:IX3DaBSPu3q+ZAWa16N2xk5ybqS/ypqwC6gHi6Snxbg="
}

step "terraform-output" {
  wkdir   = "console"
  target  = "console/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
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
  ]

  sha = "95885d5d8b8fa65c4bbc56a4164626a2b56931e311774885c5300ce6033d7736"
}

step "crds" {
  wkdir   = "console"
  target  = "console/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "console",
  ]

  sha = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
}

step "bounce" {
  wkdir   = "console"
  target  = "console/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "console",
  ]

  sha = "h1:ZOGXbGhnxtP2H05MmzncPNAMB9sdpgjinR5Z1gzj/mU="
}
