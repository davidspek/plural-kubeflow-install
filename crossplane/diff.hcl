metadata {
  path = "crossplane"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "crossplane/terraform"
  target  = "crossplane/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:81bAVd8DsCuD7ZI4Djj5ONHmIlSFlMRcvs1w27ZDp0E="
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

  sha = "e6668e14a467feb888f575d7883bb4424c9557505f43abebafa39ee52a7fde58"
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

  sha = "h1:m7+7sY4Wvyp1RZ0Y2rq0bu50yYS9W5Qgn9DoDVIHq3Y="
}
