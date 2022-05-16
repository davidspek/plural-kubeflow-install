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

  sha     = "h1:OXwpLQ+lh6rCVERMqzN8Ia5aVqOgmXQZ0pyQAOQO4E0="
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

  sha     = "h1:OXwpLQ+lh6rCVERMqzN8Ia5aVqOgmXQZ0pyQAOQO4E0="
  retries = 1
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
  ]

  sha     = "a3f5aee57ec28e0a4368dd7bd360981433639b0ae1674260a0052af6fcdd2cb9"
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

  sha     = "h1:BCpojk8ThGGQlzY20D0trC9NM4iYMaEEtOI9JTFodt0="
  retries = 1
  verbose = false
}
