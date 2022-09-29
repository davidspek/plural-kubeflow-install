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

  sha     = "h1:o0H1HbeWB2aiv3gO2Ori2GfSMa7NOyY7p80U0wQq9YM="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "kubeflow/terraform"
  target  = "kubeflow/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:o0H1HbeWB2aiv3gO2Ori2GfSMa7NOyY7p80U0wQq9YM="
  retries = 2
  verbose = false
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

  sha     = "h1:o0H1HbeWB2aiv3gO2Ori2GfSMa7NOyY7p80U0wQq9YM="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "kubeflow"
  target  = "kubeflow/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "9226fbe8f2677fd74e4f1e8b388e4dd4576c9662978a27740b684667e73d11b0"
  retries = 0
  verbose = false
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

  sha     = "h1:Kf9j+Zop/krPEUdi/eqtxv1gc++9gE+wUF8kqPejqwM="
  retries = 0
  verbose = false
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

  sha     = "h1:qMtXvLWuLIQBnsewWY0a/o/rNhfFQkU+fmK40xGpfqY="
  retries = 2
  verbose = false
}
