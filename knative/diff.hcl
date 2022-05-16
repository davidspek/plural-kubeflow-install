metadata {
  path = "knative"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "knative/terraform"
  target  = "knative/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:OXwpLQ+lh6rCVERMqzN8Ia5aVqOgmXQZ0pyQAOQO4E0="
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

  sha     = "h1:OXwpLQ+lh6rCVERMqzN8Ia5aVqOgmXQZ0pyQAOQO4E0="
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

  sha     = "5f77509130c9da456da7f18d46871dc25397f6c4f2e80e1016b634ae1234ffa5"
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

  sha     = "h1:q0vQ/Pv2jzFJY7X3LnG9SVkSWRk4wjBWdTZ3mDYPCvk="
  retries = 0
  verbose = false
}
