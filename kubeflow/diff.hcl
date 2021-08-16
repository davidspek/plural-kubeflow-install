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

  sha = "c75d76509ad2b19822508ab0c0ecdb4806d323f334c13e47e88316f45db0dd76"
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

  sha = "h1:e6mgxlgH8VCTvdzJSTSxYiiu90qSGyHdEYW9RyshAHM="
}
