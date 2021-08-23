metadata {
  path = "nvidia-operator"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "nvidia-operator/terraform"
  target  = "nvidia-operator/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:G9deUA4HeS1qnSiOCYFrzAXP3XhoKIjUsB3C2Niz3kU="
}

step "terraform" {
  wkdir   = "nvidia-operator/terraform"
  target  = "nvidia-operator/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "nvidia-operator",
  ]

  sha = "h1:G9deUA4HeS1qnSiOCYFrzAXP3XhoKIjUsB3C2Niz3kU="
}

step "kube-init" {
  wkdir   = "nvidia-operator"
  target  = "nvidia-operator/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "nvidia-operator",
  ]

  sha = "0806d046f7ea57fb0cdfa7f9785c2ea113ab2824e27cb6d394233ca0d3af177e"
}

step "helm" {
  wkdir   = "nvidia-operator/helm"
  target  = "nvidia-operator/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "nvidia-operator",
  ]

  sha = "h1:qkm2G0z3VZMMA47SQZmGUEeBcqf1cHYD/LCwTy7+xpQ="
}
