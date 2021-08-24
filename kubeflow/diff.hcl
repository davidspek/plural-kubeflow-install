metadata {
  path = "kubeflow"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "kubeflow/terraform"
  target  = "kubeflow/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:ledJkUnD8GUfhAgtptmJFE7ILTvSw/aO+uzJZqb1AR4="
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

  sha = "h1:ledJkUnD8GUfhAgtptmJFE7ILTvSw/aO+uzJZqb1AR4="
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

  sha = "a6dfdef0793172937b23aa7a0636cf4321c617fd539db5dba1c059e7bb94219c"
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

  sha = "h1:clhoWf1V01Clzw78dZ6CNtlCBkpfKSETYua/TK96N/U="
}
