metadata {
  path = "crossplane"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "crossplane/terraform"
  target  = "crossplane/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:5+Rb3JgtjEac6GuyF4JLaWzGZ4MN0ZxnzuBlDfl0K/c="
  retries = 0
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

  sha     = "h1:5+Rb3JgtjEac6GuyF4JLaWzGZ4MN0ZxnzuBlDfl0K/c="
  retries = 0
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

  sha     = "a3e3e5b379cafd027d06e042ced119929dcff0531c20951e9657d2a15a195a88"
  retries = 0
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

  sha     = "h1:YeE4sW9aRhDSwAKIG4KGRB4fFyt2HDRPAIU+ppiL5vg="
  retries = 0
}
