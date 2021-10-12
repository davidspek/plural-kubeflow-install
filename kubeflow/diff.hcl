metadata {
  path = "kubeflow"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "kubeflow/terraform"
  target  = "kubeflow/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:dBil3ILhGsQ9+8jrKFP6jlhMNFt5/UbdD4sLniq2VfM="
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

  sha     = "h1:dBil3ILhGsQ9+8jrKFP6jlhMNFt5/UbdD4sLniq2VfM="
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

  sha     = "1c84c6bfd64c6ded38ef8bf2544c2db8b7f149e41ec12773aa15ecf979f55663"
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

  sha     = "h1:dG8Y7LtRq4E5BlMpiefoIr+m5Ms7JO/C+n6yFBBVtOs="
  retries = 0
}
