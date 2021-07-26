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

  sha = "184e6da53b923e7992de7ff18c6105968ee6d392c2a1e2cf1bb7d288f7c9c21d"
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

  sha = "h1:YeE4sW9aRhDSwAKIG4KGRB4fFyt2HDRPAIU+ppiL5vg="
}
