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

  sha     = "85bd3a21dd6ea7770edc030ce3f2c43bc6f721a4df45730f26fcf76ebe7be417"
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

  sha     = "h1:945aMdLmYGjvzEduGPuLzcmIyjMQkpmHCvlh/UT/LXw="
  retries = 0
}
