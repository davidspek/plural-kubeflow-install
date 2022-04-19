metadata {
  path = "kubeflow"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "kubeflow/terraform"
  target  = "kubeflow/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:zXCeEf6wBqRBQVrFO0i+V2gaa1EZ7M8DcaDIXTwdX4E="
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

  sha     = "h1:zXCeEf6wBqRBQVrFO0i+V2gaa1EZ7M8DcaDIXTwdX4E="
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

  sha     = "f15fc8d09c73b502837b70fe00e45e01a992c1ca2bd6b96849cc242eef49d7c9"
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

  sha     = "h1:W5I0/Y+gQPcblnybwH3X0DoN2ySgTg++oKw2Iolm2ys="
  retries = 0
}
