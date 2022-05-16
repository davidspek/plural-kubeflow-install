metadata {
  path = "nvidia-operator"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "nvidia-operator/terraform"
  target  = "nvidia-operator/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:3hEnNq1i/8vg3+XHfbwYJlUqANgF09F8vDGHPU4npHA="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "nvidia-operator/terraform"
  target  = "nvidia-operator/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:3hEnNq1i/8vg3+XHfbwYJlUqANgF09F8vDGHPU4npHA="
  retries = 1
  verbose = false
}

step "terraform-output" {
  wkdir   = "nvidia-operator"
  target  = "nvidia-operator/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
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
  ]

  sha     = "e52229a190bf71aa14c5875b4a6c7c8a8fd677b82cc81a504d4d4ca79e7be66e"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "nvidia-operator"
  target  = "nvidia-operator/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "nvidia-operator",
  ]

  sha     = "h1:t5FX13K5805hSb5jzTOmMhUKVOuLAwejhp3iyG/QLBc="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "nvidia-operator"
  target  = "nvidia-operator/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "nvidia-operator",
  ]

  sha     = "h1:ZdcZXGm/j0yexdCqhpUva0v/L5N7/q4NwarRiYjavnU="
  retries = 1
  verbose = false
}
