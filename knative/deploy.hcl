metadata {
  path = "knative"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "knative/terraform"
  target  = "knative/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:B+sS9uCXGb+qtWs/YD/GOSyowsLhdyU9XRzcNjuQzEY="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "knative/terraform"
  target  = "knative/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:B+sS9uCXGb+qtWs/YD/GOSyowsLhdyU9XRzcNjuQzEY="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "knative"
  target  = "knative/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
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
  ]

  sha     = "2cdd5175951c8cd16449caa714abf76934b0e3fda67fafdea0c280d4e4525c99"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "knative"
  target  = "knative/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "knative",
  ]

  sha     = "h1:or38XWULSBe79YhL1TAgy+gr5mxJyPfJh4r1Wv5/lsg="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "knative"
  target  = "knative/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "knative",
  ]

  sha     = "h1:a59CpP6MucU2h/P0C2wztOKpBt3jI+GnAZAGxE+E2wM="
  retries = 2
  verbose = false
}
