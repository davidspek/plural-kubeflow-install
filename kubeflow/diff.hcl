metadata {
  path = "kubeflow"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "kubeflow/terraform"
  target  = "kubeflow/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:fZL+9TO9QHlHjQP82UtbJE+P1Q/8Gc2uUFtb9LM5xcE="
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

  sha     = "h1:fZL+9TO9QHlHjQP82UtbJE+P1Q/8Gc2uUFtb9LM5xcE="
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

  sha     = "d759eff1cd2d374ebf55a2c7090c6c3ce46139c410af0d1a0e6947b086863238"
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

  sha     = "h1:8U+n4UFntkqyceQf/c7ab9mNnsjDAU9OdaAj/KW5IBI="
  retries = 0
}
