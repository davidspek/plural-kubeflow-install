metadata {
  path = "crossplane"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "crossplane/terraform"
  target  = "crossplane/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:HXzyhD/TU/7P+26+aWdDWo1z/Gcwyf+/l7ovRiWTdbM="
}

step "terraform-apply" {
  wkdir   = "crossplane/terraform"
  target  = "crossplane/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha = "h1:HXzyhD/TU/7P+26+aWdDWo1z/Gcwyf+/l7ovRiWTdbM="
}

step "terraform-output" {
  wkdir   = "crossplane"
  target  = "crossplane/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
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

step "crds" {
  wkdir   = "crossplane"
  target  = "crossplane/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "crossplane",
  ]

  sha = "h1:EVuJcAA7WuJRXVU1CIcPLtDQQyXIfFsk2B+ENtAEtn4="
}

step "bounce" {
  wkdir   = "crossplane"
  target  = "crossplane/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "crossplane",
  ]

  sha = "h1:uKFhyzBHNwA2hAHx+g0D+Lx4YU4cIPLv4kDTtR1Fg9Q="
}
