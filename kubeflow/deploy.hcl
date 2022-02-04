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

  sha     = "h1:fZL+9TO9QHlHjQP82UtbJE+P1Q/8Gc2uUFtb9LM5xcE="
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

  sha     = "h1:fZL+9TO9QHlHjQP82UtbJE+P1Q/8Gc2uUFtb9LM5xcE="
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
  ]

  sha     = "85bd3a21dd6ea7770edc030ce3f2c43bc6f721a4df45730f26fcf76ebe7be417"
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

  sha     = "h1:EDrND1e5r1NB4UmlR6VY/pSxZ0N2lnWC9WmW+mbIgzE="
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

  sha     = "h1:945aMdLmYGjvzEduGPuLzcmIyjMQkpmHCvlh/UT/LXw="
  retries = 1
}
