metadata {
  path = "gitlab"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "gitlab/terraform"
  target  = "gitlab/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = ""
}

step "terraform" {
  wkdir   = "gitlab/terraform"
  target  = "gitlab/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "gitlab",
  ]

  sha = ""
}

step "kube-init" {
  wkdir   = "gitlab"
  target  = "gitlab/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "gitlab",
  ]

  sha = ""
}

step "helm" {
  wkdir   = "gitlab/helm"
  target  = "gitlab/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "gitlab",
  ]

  sha = ""
}
