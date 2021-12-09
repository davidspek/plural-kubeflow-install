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

  sha     = "h1:6D4cmdob0Hvm9wn4r6OJTgA/5OTLvZJQ42C9t+372AE="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "knative/terraform"
  target  = "knative/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:6D4cmdob0Hvm9wn4r6OJTgA/5OTLvZJQ42C9t+372AE="
  retries = 1
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

  sha     = "h1:6D4cmdob0Hvm9wn4r6OJTgA/5OTLvZJQ42C9t+372AE="
  retries = 0
}

step "kube-init" {
  wkdir   = "knative"
  target  = "knative/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "8360118a0a4bb19e1853c08d8d35519222f8b7d211df58ecb491f88dd5ef0d6c"
  retries = 0
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

  sha     = "h1:7fQE0T5f5o2x5p3TBk4vqSTFa6mJ6ZD1DbSR6TX11YM="
  retries = 1
}
