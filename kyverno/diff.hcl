metadata {
  path = "kyverno"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "kyverno/terraform"
  target  = "kyverno/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = ""
  retries = 0
}

step "terraform" {
  wkdir   = "kyverno/terraform"
  target  = "kyverno/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "kyverno",
  ]

  sha     = ""
  retries = 0
}

step "kube-init" {
  wkdir   = "kyverno"
  target  = "kyverno/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "kyverno",
  ]

  sha     = ""
  retries = 0
}

step "helm" {
  wkdir   = "kyverno/helm"
  target  = "kyverno/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "kyverno",
  ]

  sha     = ""
  retries = 0
}
