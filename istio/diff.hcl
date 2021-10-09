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

  sha     = "0173921bcc0a0a95e84e4d3d80fcc2c429fbfaa2b7364fbd17bd173b2f252bbe"
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
