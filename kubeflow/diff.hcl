metadata {
  path = "kubeflow"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "kubeflow/terraform"
  target  = "kubeflow/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:cEbGs3aE5570Y/A9OYKOKXKFvWNW4Sd338ydQ5DMrBI="
  retries = 0
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

  sha     = "h1:cEbGs3aE5570Y/A9OYKOKXKFvWNW4Sd338ydQ5DMrBI="
  retries = 0
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

  sha     = "ab92c7d3c82b713b011c93ef0e4e758ed342402909964a1962571f11fa485e6d"
  retries = 0
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

  sha     = "h1:szFAXs5tl8TfwYJBhPE7C+kKFnZzf6TYqUk/QAP/Ddk="
  retries = 0
}
