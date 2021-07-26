metadata {
  path = "crossplane"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "crossplane/terraform"
  target  = "crossplane/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:HXzyhD/TU/7P+26+aWdDWo1z/Gcwyf+/l7ovRiWTdbM="
}

step "terraform" {
  wkdir   = "crossplane/terraform"
  target  = "crossplane/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "crossplane",
  ]

  sha = "h1:HXzyhD/TU/7P+26+aWdDWo1z/Gcwyf+/l7ovRiWTdbM="
}

step "kube-init" {
  wkdir   = "crossplane"
  target  = "crossplane/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "crossplane",
  ]

  sha = "2668b85d3907994aa650534c59ca44f6feccbca8d1c2ceb56b46dbbd9cf1b606"
}

step "helm" {
  wkdir   = "crossplane/helm"
  target  = "crossplane/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "crossplane",
  ]

  sha = "h1:uKFhyzBHNwA2hAHx+g0D+Lx4YU4cIPLv4kDTtR1Fg9Q="
}
