metadata {
  path = "crossplane"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "crossplane/terraform"
  target  = "crossplane/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:81bAVd8DsCuD7ZI4Djj5ONHmIlSFlMRcvs1w27ZDp0E="
}

step "terraform-apply" {
  wkdir   = "crossplane/terraform"
  target  = "crossplane/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha = "h1:81bAVd8DsCuD7ZI4Djj5ONHmIlSFlMRcvs1w27ZDp0E="
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

  sha = "h1:81bAVd8DsCuD7ZI4Djj5ONHmIlSFlMRcvs1w27ZDp0E="
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

  sha = "01f6725ebf6d2a07a274e8833493280bc713effcc3ac568827bdf1a1f900fb84"
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
