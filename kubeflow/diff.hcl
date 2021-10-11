metadata {
  path = "kubeflow"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "kubeflow/terraform"
  target  = "kubeflow/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:m+pUG3tPIJ1Eata7qUCIu5vKWPugf/5p9QCMPVWkRWI="
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

  sha     = "h1:m+pUG3tPIJ1Eata7qUCIu5vKWPugf/5p9QCMPVWkRWI="
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

  sha     = "621d6c1aef0a59617600bb4aac2808dabed1c49d0159287a78e39327f3396379"
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

  sha     = "h1:xvFJ+VSdZ5hNMgiWTSw0J9P4DMOT6qJvPruhJxFcgQQ="
  retries = 0
}
