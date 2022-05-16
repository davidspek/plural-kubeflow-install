metadata {
  path = "nvidia-operator"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "nvidia-operator/terraform"
  target  = "nvidia-operator/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:3hEnNq1i/8vg3+XHfbwYJlUqANgF09F8vDGHPU4npHA="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "nvidia-operator/terraform"
  target  = "nvidia-operator/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "nvidia-operator",
  ]

  sha     = "h1:3hEnNq1i/8vg3+XHfbwYJlUqANgF09F8vDGHPU4npHA="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "nvidia-operator"
  target  = "nvidia-operator/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "nvidia-operator",
  ]

  sha     = "e52229a190bf71aa14c5875b4a6c7c8a8fd677b82cc81a504d4d4ca79e7be66e"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "nvidia-operator/helm"
  target  = "nvidia-operator/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "nvidia-operator",
  ]

  sha     = "h1:ZdcZXGm/j0yexdCqhpUva0v/L5N7/q4NwarRiYjavnU="
  retries = 0
  verbose = false
}
