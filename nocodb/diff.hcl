metadata {
  path = "nocodb"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "nocodb/terraform"
  target  = "nocodb/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:78En4+21QdkiL/H2+RVVj+wut6XF4qfQw5Ubu5vs3iE="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "nocodb/terraform"
  target  = "nocodb/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "nocodb",
  ]

  sha     = "h1:78En4+21QdkiL/H2+RVVj+wut6XF4qfQw5Ubu5vs3iE="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "nocodb"
  target  = "nocodb/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "nocodb",
  ]

  sha     = "680235b20dcf40a8a83d8780a1d9c52dd56122be921b1134e68545a4f8b91343"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "nocodb/helm"
  target  = "nocodb/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "nocodb",
  ]

  sha     = "h1:T0M3EgwxFWNkrSjxQlW9sBWzXBNU3TzBqV3fyRvK6t4="
  retries = 0
  verbose = false
}
