metadata {
  path = "bootstrap"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:R2naCASBqw/X7FYq0R/vW0g8vuKJ9Vp0+dVzfsMbnP8="
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

  sha = "h1:R2naCASBqw/X7FYq0R/vW0g8vuKJ9Vp0+dVzfsMbnP8="
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

  sha = "4918b060f305b2e914ee4ca72c4d0f8881e5af13c6d5674d2bcca5208fb95de2"
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

  sha = "h1:k3zxd1NPd1rNmvuXz14jXrUsbIWIduGIR1um+YodA54="
}
