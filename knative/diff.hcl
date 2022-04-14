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

  sha     = "324d6fd465765f417ea1c481a81fa329cbd95d5bd4867aa549807368218edcb1"
  retries = 0
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

  sha     = "h1:eMOfYutRaYD2SO0WZG5H4h/m9HhFzUyvcOSeenEYXWY="
  retries = 0
}
