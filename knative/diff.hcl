metadata {
  path = "knative"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "knative/terraform"
  target  = "knative/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:PwxLrDGEB2uUHLCtYV9r3InmGOtEKFtcdpeYgQZAELE="
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

  sha     = "h1:PwxLrDGEB2uUHLCtYV9r3InmGOtEKFtcdpeYgQZAELE="
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

  sha     = "b50dd0627d4bcb4fa09b0c96f23067362765927049488816b0240b4bc71ae58f"
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

  sha     = "h1:xJmOW9nfxYDgPNkvMNKKLTJFE24qqZ3v0utclxUdBMc="
  retries = 0
}
