metadata {
  path = "kubeflow"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "kubeflow/terraform"
  target  = "kubeflow/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:N0j45D7O2x4R+i3kQC2J+9l5H1AbBr1bYWnxuVPZPOk="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "kubeflow/terraform"
  target  = "kubeflow/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:N0j45D7O2x4R+i3kQC2J+9l5H1AbBr1bYWnxuVPZPOk="
  retries = 1
}

step "terraform-output" {
  wkdir   = "kubeflow"
  target  = "kubeflow/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
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
  ]

  sha     = "17d2f09979bd264c0d85715c7fe57a209b0ba5f3eec282fa63e573e9d0bfa8e5"
  retries = 0
}

step "crds" {
  wkdir   = "kubeflow"
  target  = "kubeflow/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "kubeflow",
  ]

  sha     = "h1:w6J5NKYCBryaZnu7orrOEvm0P/XzHgvBQheolHb7988="
  retries = 0
}

step "bounce" {
  wkdir   = "kubeflow"
  target  = "kubeflow/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "kubeflow",
  ]

  sha     = "h1:bg3eleWlkf0NGj1Xp1D2qYE4JNwJWtlr1JtLDllKvec="
  retries = 1
}
