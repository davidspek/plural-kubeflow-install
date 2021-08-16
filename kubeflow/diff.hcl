metadata {
  path = "kubeflow"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "kubeflow/terraform"
  target  = "kubeflow/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:MyasH5JSu0V4XZXTLVnEvaC5nV/DNbvJWBXMfWb5htw="
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

  sha = "h1:MyasH5JSu0V4XZXTLVnEvaC5nV/DNbvJWBXMfWb5htw="
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

  sha = "1de9498413c9e2173bf965aa0edee57b1a379a05535bb72d523c167656542450"
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

  sha = "h1:2e4Xh55c6USWJjpU9RmmooUJtyKXwR5geIECf8OAHJY="
}
