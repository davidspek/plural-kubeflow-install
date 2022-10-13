metadata {
  path = "datahub"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "datahub/terraform"
  target  = "datahub/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:j7R8zQnjmIqvuXEpFmzSWMRIa5B5GPx9UFn8E70dkDM="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "datahub/terraform"
  target  = "datahub/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "datahub",
  ]

  sha     = "h1:j7R8zQnjmIqvuXEpFmzSWMRIa5B5GPx9UFn8E70dkDM="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "datahub"
  target  = "datahub/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "datahub",
  ]

  sha     = "f0db35e189523fb7fedbca5f0606e1bf6e4aacde111289f78c401d50af6c45f5"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "datahub/helm"
  target  = "datahub/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "datahub",
  ]

  sha     = "h1:qaRuJ7lf0ZVWIV+0g+mM3YmyjGdwqGzQcbaTXBymjXw="
  retries = 0
  verbose = false
}
