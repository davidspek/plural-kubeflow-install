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

  sha     = "1fd1a745f4ea3bb4fe44cbbb53a84169e6cf11a2d05a7127270e482ee71262ea"
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

  sha     = "h1:6dAHFLapAK/ECZdJkNMlguaA86WPaDAMORJl6tf7olc="
  retries = 0
  verbose = false
}
