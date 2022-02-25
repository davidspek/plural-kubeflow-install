metadata {
  path = "crossplane"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "crossplane/terraform"
  target  = "crossplane/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:6WkdMsNb4UXJdfb9Gap0NSiDNx73zE+Qd1l7F/MsCKU="
  retries = 0
}

step "terraform" {
  wkdir   = "crossplane/terraform"
  target  = "crossplane/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "crossplane",
  ]

  sha     = "h1:6WkdMsNb4UXJdfb9Gap0NSiDNx73zE+Qd1l7F/MsCKU="
  retries = 0
}

step "kube-init" {
  wkdir   = "crossplane"
  target  = "crossplane/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "crossplane",
  ]

  sha     = "0be80e0ae8db5f5cf42874418d48afcc5afb46853d03b6f1f62633bb40dda9d6"
  retries = 0
}

step "helm" {
  wkdir   = "crossplane/helm"
  target  = "crossplane/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "crossplane",
  ]

  sha     = "h1:SresmnzWF73bqNpwTKHdMJo/MO7nnswLhpqLFr7bo8M="
  retries = 0
}
