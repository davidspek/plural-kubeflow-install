metadata {
  path = "spark"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "spark/terraform"
  target  = "spark/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = ""
  retries = 0
}

step "terraform" {
  wkdir   = "spark/terraform"
  target  = "spark/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "spark",
  ]

  sha     = ""
  retries = 0
}

step "kube-init" {
  wkdir   = "spark"
  target  = "spark/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "spark",
  ]

  sha     = ""
  retries = 0
}

step "helm" {
  wkdir   = "spark/helm"
  target  = "spark/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "spark",
  ]

  sha     = ""
  retries = 0
}
