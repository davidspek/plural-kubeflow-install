metadata {
  path = "istio"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "istio/terraform"
  target  = "istio/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:pk9tDVS0S08kzQit9SAZygePKs1XMBrR+PTSbQCyCVc="
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

  sha     = "h1:pk9tDVS0S08kzQit9SAZygePKs1XMBrR+PTSbQCyCVc="
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

  sha     = "43c6f62d81d5300958c7df0f55ecc93f049e1a631196b94b6c8a4cc240d5f9c2"
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

  sha     = "h1:xntoBrkHXAar+vHWRN+KIBETMxVvgmc3G1EsD0iNo5U="
  retries = 0
}
