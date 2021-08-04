metadata {
  path = "monitoring"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:eZGbPjdigQUyuYrZEqBLFti2v94WT6Ra+BenaC25v2k="
}

step "terraform" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "monitoring",
  ]

  sha = "h1:eZGbPjdigQUyuYrZEqBLFti2v94WT6Ra+BenaC25v2k="
}

step "kube-init" {
  wkdir   = "monitoring"
  target  = "monitoring/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "monitoring",
  ]

  sha = "2e7c3e7dd72b7033f79753afe7fee9d4cb65b5ff1eee9d8a8c90115005ee7e55"
}

step "helm" {
  wkdir   = "monitoring/helm"
  target  = "monitoring/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "monitoring",
  ]

  sha = "h1:1A2ueqq0LhcrK9/LeqseIqNrlnhVltegeSM/dOafMBM="
}
