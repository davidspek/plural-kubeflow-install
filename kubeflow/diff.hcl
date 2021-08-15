metadata {
  path = "kubeflow"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "kubeflow/terraform"
  target  = "kubeflow/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:x1rjJPUOAAOmNvT5VCQTQoeW7AKbf+b5llY6UB5GqkU="
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

  sha = "h1:x1rjJPUOAAOmNvT5VCQTQoeW7AKbf+b5llY6UB5GqkU="
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

  sha = "a6bb33042aa5f733c451e6b6e2c2c92d03f720fba71cbcc1fae8f80c02a71d00"
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

  sha = "h1:h51Vsk23rAlSK9j2mQmzt2W8oYQ6kzIdm7rtLASqSm0="
}
