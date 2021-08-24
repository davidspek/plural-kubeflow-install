metadata {
  path = "kubeflow"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "kubeflow/terraform"
  target  = "kubeflow/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:ledJkUnD8GUfhAgtptmJFE7ILTvSw/aO+uzJZqb1AR4="
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

  sha = "h1:ledJkUnD8GUfhAgtptmJFE7ILTvSw/aO+uzJZqb1AR4="
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

  sha = "48ea832b2680dc28358b822214392a954d3b6c300386d78a3c67d91b749cddc0"
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

  sha = "h1:RXIVRRRTFTErJ+frfR3Rz9UqRRfd1GgNXpJhTytFHXI="
}
