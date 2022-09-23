metadata {
  path = "bootstrap"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:3eVZ0hr5Q8itLmugggvwlAaUqianPLLH4hZi6DApvX8="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "bootstrap",
  ]

  sha     = "h1:3eVZ0hr5Q8itLmugggvwlAaUqianPLLH4hZi6DApvX8="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "bootstrap"
  target  = "bootstrap/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "bootstrap",
  ]

  sha     = "f3b628bf427aaba8a2fc1456f294b77e6c16c2db69c5a4ab059b010267359f3b"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "bootstrap/helm"
  target  = "bootstrap/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "bootstrap",
  ]

  sha     = "h1:1D5wXVksQI3TnzKWEN4nM+lZb70UrJ8XE+JwR8XvVgk="
  retries = 0
  verbose = false
}
