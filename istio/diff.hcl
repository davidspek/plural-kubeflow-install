metadata {
  path = "istio"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "istio/terraform"
  target  = "istio/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:aOqzsN6tWoHApZmWO1c3SRLoZ1qWzV3M17U1w+tc9H4="
  retries = 0
}

step "terraform" {
  wkdir   = "istio/terraform"
  target  = "istio/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "istio",
  ]

  sha     = "h1:aOqzsN6tWoHApZmWO1c3SRLoZ1qWzV3M17U1w+tc9H4="
  retries = 0
}

step "kube-init" {
  wkdir   = "istio"
  target  = "istio/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "istio",
  ]

  sha     = "2cbd7ebac24d20b45bbf1b11170bc4928d273664b33d7d01bdb500c6a5d9a820"
  retries = 0
}

step "helm" {
  wkdir   = "istio/helm"
  target  = "istio/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "istio",
  ]

  sha     = "h1:qRctvLDX80eWJKk0xC4oODd4iy9Fp/6djPyRykRBZZo="
  retries = 0
}
