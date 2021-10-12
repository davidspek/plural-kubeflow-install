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

  sha     = "6989002c9ae5e31bf34474e655ec2cd50a381fade40bda82b9e7b86ba8caf033"
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

  sha     = "h1:I7xIBXCTlO4n7pjTc7YnKZPjBAjWphkw6fZGRbo2/j4="
  retries = 0
}
