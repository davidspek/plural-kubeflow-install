metadata {
  path = "kubeflow"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "kubeflow/terraform"
  target  = "kubeflow/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:baUVHHK6MVdEvGvUqFjzr66j4+BCjQShYlAUuPtgvkg="
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

  sha     = "h1:baUVHHK6MVdEvGvUqFjzr66j4+BCjQShYlAUuPtgvkg="
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

  sha     = "ca7d76f25a324810f3d356e5add846b9e1a2e14d56679a5b66011711dd05bba8"
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

  sha     = "h1:2uua3A/bpIRfmtvx68kJwVh2PNUdLSo0VQvkjfPw2Qc="
  retries = 0
}
