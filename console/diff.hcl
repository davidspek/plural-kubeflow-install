metadata {
  path = "console"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:8GxTpFpq63F0IgxozTqEIeLIA4TuHGYqR6hfy+wmxB4="
}

step "terraform" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "console",
  ]

  sha = "h1:8GxTpFpq63F0IgxozTqEIeLIA4TuHGYqR6hfy+wmxB4="
}

step "kube-init" {
  wkdir   = "console"
  target  = "console/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "console",
  ]

  sha = "8a6ba6d21a804c6d84447bb0e0c9b0cb227dc69f8dcb7fd69e05d1e64665f090"
}

step "helm" {
  wkdir   = "console/helm"
  target  = "console/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "console",
  ]

  sha = "h1:q9jXRJcOZiWNJVUakyJWG22GPLysja9A4u8hsF3qvMY="
}
