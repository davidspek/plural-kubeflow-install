metadata {
  path = "argo-cd"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "argo-cd/terraform"
  target  = "argo-cd/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:hyruAm+wGZoKW6eHAnVLuCOSKMhXLSBwIW1c9wHFfPA="
  retries = 0
}

step "terraform" {
  wkdir   = "argo-cd/terraform"
  target  = "argo-cd/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "argo-cd",
  ]

  sha     = "h1:hyruAm+wGZoKW6eHAnVLuCOSKMhXLSBwIW1c9wHFfPA="
  retries = 0
}

step "kube-init" {
  wkdir   = "argo-cd"
  target  = "argo-cd/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "argo-cd",
  ]

  sha     = "8ba9b934c0099e4705af5458333b63e3a29d707981225c51b48c85ff3ec2c27a"
  retries = 0
}

step "helm" {
  wkdir   = "argo-cd/helm"
  target  = "argo-cd/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "argo-cd",
  ]

  sha     = "h1:3jFYGViVSHWt1q1rhQ02jSd9nPg8sOVkXtCBrCbGpE8="
  retries = 0
}
