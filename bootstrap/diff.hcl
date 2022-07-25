metadata {
  path = "bootstrap"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:ZhcHbhIbZ/X0oo5fB0naqbZOWjMMbkjPWgagUmTRzB8="
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

  sha     = "h1:ZhcHbhIbZ/X0oo5fB0naqbZOWjMMbkjPWgagUmTRzB8="
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

  sha     = "f00353ccb86fce3ab8ccdf50967e71d6e9ebd27d19bd6ce8df51e44cf04ef307"
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

  sha     = "h1:hAnY5dud+0aDadiMUkbVA2AhqoDFDfjpMOHFATFKvsg="
  retries = 0
  verbose = false
}
