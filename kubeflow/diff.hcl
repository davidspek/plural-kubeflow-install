metadata {
  path = "kubeflow"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "kubeflow/terraform"
  target  = "kubeflow/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:2jX8rp/LPKi5GfsNxP1TtHEb1su9deFXV6qQZHud6P0="
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

  sha     = "h1:2jX8rp/LPKi5GfsNxP1TtHEb1su9deFXV6qQZHud6P0="
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

  sha     = "bb690d30487e78123a2bc8cb60f2291cd16db30625c246581e5263236f143d54"
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
