metadata {
  path = "knative"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "knative/terraform"
  target  = "knative/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:B+sS9uCXGb+qtWs/YD/GOSyowsLhdyU9XRzcNjuQzEY="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "knative/terraform"
  target  = "knative/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "knative",
  ]

  sha     = "h1:B+sS9uCXGb+qtWs/YD/GOSyowsLhdyU9XRzcNjuQzEY="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "knative"
  target  = "knative/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "knative",
  ]

  sha     = "2cdd5175951c8cd16449caa714abf76934b0e3fda67fafdea0c280d4e4525c99"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "knative/helm"
  target  = "knative/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "knative",
  ]

  sha     = "h1:a59CpP6MucU2h/P0C2wztOKpBt3jI+GnAZAGxE+E2wM="
  retries = 0
  verbose = false
}
