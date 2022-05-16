metadata {
  path = "postgres"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "postgres/terraform"
  target  = "postgres/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:wvfBW8Xg9MJFV5fVET1WcfGWb3fboMz/ZK9pjd7XG/E="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "postgres/terraform"
  target  = "postgres/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "postgres",
  ]

  sha     = "h1:wvfBW8Xg9MJFV5fVET1WcfGWb3fboMz/ZK9pjd7XG/E="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "postgres"
  target  = "postgres/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "postgres",
  ]

  sha     = "eb1dc9afb64a005de125e6394b96126bae7dc8b91cfe0c5da0cc0070dad5af74"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "postgres/helm"
  target  = "postgres/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "postgres",
  ]

  sha     = "h1:cPUtGKC4TmPML9Ci5V0IgSMUgPLp336d4IgUQ/S2qac="
  retries = 0
  verbose = false
}
