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

  sha     = "a8f5565742d2bd869bed4dfe6f4a59bb55afa0566f6c5c691374ee58d5eadb4a"
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

  sha     = "h1:baUFLCZYrgjmG8YMaCB8Cnjc1iHEbnhXLOoB2fv3Yv0="
  retries = 0
  verbose = false
}
