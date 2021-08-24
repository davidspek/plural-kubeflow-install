metadata {
  path = "kubeflow"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "kubeflow/terraform"
  target  = "kubeflow/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:Rx+Ji5rOU/Ie8QlEx9qd5ZvbJiUrYxar3EWNgLsXGpY="
}

step "terraform" {
  wkdir   = "kubeflow/terraform"
  target  = "kubeflow/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "kubeflow",
  ]

  sha = "h1:Rx+Ji5rOU/Ie8QlEx9qd5ZvbJiUrYxar3EWNgLsXGpY="
}

step "kube-init" {
  wkdir   = "kubeflow"
  target  = "kubeflow/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "kubeflow",
  ]

  sha = "5a9b417d0e0e123b069dd83bad1a9038b7ad1377b62923369d300184a46380f2"
}

step "helm" {
  wkdir   = "kubeflow/helm"
  target  = "kubeflow/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "kubeflow",
  ]

  sha = "h1:0eEDaNlAS32LaeHY/8/XrV3JoaVsyDHG5Qiz8j2XCYs="
}
