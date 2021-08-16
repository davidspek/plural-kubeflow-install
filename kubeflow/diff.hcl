metadata {
  path = "kubeflow"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "kubeflow/terraform"
  target  = "kubeflow/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:WS5fwyUstruV92HEJQpOZHRZdjhAO1+c+qAEPWHB1ic="
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

  sha = "h1:WS5fwyUstruV92HEJQpOZHRZdjhAO1+c+qAEPWHB1ic="
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

  sha = "b81c29bfcee325c28c11ea39e4d9d8932b01fb6a9b83969fef6d930681bbcd0e"
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

  sha = "h1:+FghQhzUjNmW36+sNp85kiSViEwsCNHpnRawYJ0KlnM="
}
