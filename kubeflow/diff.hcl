metadata {
  path = "kubeflow"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "kubeflow/terraform"
  target  = "kubeflow/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:N0j45D7O2x4R+i3kQC2J+9l5H1AbBr1bYWnxuVPZPOk="
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

  sha     = "h1:N0j45D7O2x4R+i3kQC2J+9l5H1AbBr1bYWnxuVPZPOk="
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

  sha     = "17d2f09979bd264c0d85715c7fe57a209b0ba5f3eec282fa63e573e9d0bfa8e5"
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

  sha     = "h1:bg3eleWlkf0NGj1Xp1D2qYE4JNwJWtlr1JtLDllKvec="
  retries = 0
}
