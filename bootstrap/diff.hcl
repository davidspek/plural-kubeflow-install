metadata {
  path = "bootstrap"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:7GGIVFPOnlbWJwraWvjiTF6WxuxjTkjZAQkQFZNYzBg="
  retries = 0
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

  sha     = "h1:7GGIVFPOnlbWJwraWvjiTF6WxuxjTkjZAQkQFZNYzBg="
  retries = 0
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

  sha     = "b5063850eca10c8cdc424274ef49fb3a200cca01c263ee2ecf54bf8524ccdda7"
  retries = 0
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

  sha     = "h1:53kFkEPUG4CUuDbk0CXN92c6b15RX31ISYgfJ1EzHS4="
  retries = 0
}
