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

  sha = "744176f16d0fdf738c1085b5a0397811077d2c6a5f4dd11e826a88ab4a0529b0"
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

  sha = "h1:MsGHRpsFN+VKOlqfLwjRqODYtCRNA2YiQ/3KkI4vbHU="
}
