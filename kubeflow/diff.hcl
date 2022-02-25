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

  sha     = "1696417f4fe57cdb78b3cc503271a0238cd5dd5e4da874db0443c6cb24fd9cdb"
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
