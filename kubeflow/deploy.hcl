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

  sha     = "h1:c/5XHyKkPKBFwf4ILJoaJZJl+Smh+rD4glf4bMD4p4U="
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

  sha     = "h1:c/5XHyKkPKBFwf4ILJoaJZJl+Smh+rD4glf4bMD4p4U="
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

  sha     = "h1:c/5XHyKkPKBFwf4ILJoaJZJl+Smh+rD4glf4bMD4p4U="
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

  sha     = "9f01bc755f977317f9a5898fef5952a99d8f016a04103f8f6baa567bfeb938bb"
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

  sha     = "h1:+yltOFb7wj8ndcPY8djbkWWGxBzEd8XkCJw4AwgZxGM="
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

  sha     = "h1:2uua3A/bpIRfmtvx68kJwVh2PNUdLSo0VQvkjfPw2Qc="
  retries = 1
}
