metadata {
  path = "nvidia-operator"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "nvidia-operator/terraform"
  target  = "nvidia-operator/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = ""
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

  sha = ""
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

  sha = ""
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

  sha = ""
}
