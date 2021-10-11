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

  sha     = "h1:i/FMbP6rllaZKxFxOiyom1gXe/HjhA0bXl1pSxiRrlg="
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

  sha     = "h1:i/FMbP6rllaZKxFxOiyom1gXe/HjhA0bXl1pSxiRrlg="
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

  sha     = "h1:i/FMbP6rllaZKxFxOiyom1gXe/HjhA0bXl1pSxiRrlg="
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

  sha     = "0718af08e16ab99976888e7a2a7fe0caaf67a9e49f9ef5c450eeb9d1fc486672"
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
