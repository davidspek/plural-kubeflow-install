metadata {
  path = "console"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:8GxTpFpq63F0IgxozTqEIeLIA4TuHGYqR6hfy+wmxB4="
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

  sha = "h1:8GxTpFpq63F0IgxozTqEIeLIA4TuHGYqR6hfy+wmxB4="
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

  sha = "33478f0c5b63ce49d9d3df1f9bb5566241f1e2a02e05e60b1f7de3151e03a2c4"
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

  sha = "h1:ipaSp4/sHNpRjPEVqRlWapAb/POrz9W7Rx3u2C7HhFI="
}
