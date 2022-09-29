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

  sha     = "89efa62ab47324644f4ff178bf7f617efccf02196aa3f825384ec9c54e7dfd92"
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

  sha     = "h1:SW5ADhMrjwFS8CfgIDiOWNX7x9HTEZLFRI193i1FX7o="
  retries = 2
  verbose = false
}
