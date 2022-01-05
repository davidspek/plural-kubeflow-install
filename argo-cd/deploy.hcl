metadata {
  path = "argo-cd"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "argo-cd/terraform"
  target  = "argo-cd/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:hyruAm+wGZoKW6eHAnVLuCOSKMhXLSBwIW1c9wHFfPA="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "argo-cd/terraform"
  target  = "argo-cd/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:hyruAm+wGZoKW6eHAnVLuCOSKMhXLSBwIW1c9wHFfPA="
  retries = 1
}

step "terraform-output" {
  wkdir   = "argo-cd"
  target  = "argo-cd/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
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
  ]

  sha     = "7be8e13a2b546bd759920b059fa6753f16a23abbb11053a07b1a70548dad6428"
  retries = 0
}

step "crds" {
  wkdir   = "argo-cd"
  target  = "argo-cd/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "argo-cd",
  ]

  sha     = "h1:C+IcOQPZtt5b7kOJR87hRIVvo49JEM2/oTRopzumeEM="
  retries = 0
}

step "bounce" {
  wkdir   = "argo-cd"
  target  = "argo-cd/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "argo-cd",
  ]

  sha     = "h1:Pt8EnGRhGy2gmUu0cUGBBkRprAalMHjfOG+/YoCWa2k="
  retries = 1
}
