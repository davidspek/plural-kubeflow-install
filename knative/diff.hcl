metadata {
  path = "knative"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "knative/terraform"
  target  = "knative/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:6D4cmdob0Hvm9wn4r6OJTgA/5OTLvZJQ42C9t+372AE="
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
    "knative",
  ]

  sha     = "8360118a0a4bb19e1853c08d8d35519222f8b7d211df58ecb491f88dd5ef0d6c"
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

  sha     = "h1:7fQE0T5f5o2x5p3TBk4vqSTFa6mJ6ZD1DbSR6TX11YM="
  retries = 0
}
