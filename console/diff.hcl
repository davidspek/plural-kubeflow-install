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

  sha = "a87b95acfc91c83c5e107c6888565208e0b4197bf1f9b8526faf0dac7b951466"
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

  sha = "h1:OHYcjdpAOCWQqhv4vdtyaFAE4WhcPxwoau42N/mwn1c="
}
