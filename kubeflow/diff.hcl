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

  sha = "f7553e01aa55ce1a6d633f9cd70d39b84fddaef53d85d7a39c04138eea3fff07"
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

  sha = "h1:3WRB9Sf+8662O5yCWCclQ7swowAyjrylUqR5CIashjw="
}
