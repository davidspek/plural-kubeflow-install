metadata {
  path = "ingress-nginx"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "ingress-nginx/terraform"
  target  = "ingress-nginx/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:ghSxoJs6Xh0FUqW01rjkMH6ng2CGK1c+T7x0Dm+FxMY="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "ingress-nginx/terraform"
  target  = "ingress-nginx/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:ghSxoJs6Xh0FUqW01rjkMH6ng2CGK1c+T7x0Dm+FxMY="
  retries = 1
}

step "terraform-output" {
  wkdir   = "ingress-nginx"
  target  = "ingress-nginx/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "ingress-nginx",
  ]

  sha     = "h1:ghSxoJs6Xh0FUqW01rjkMH6ng2CGK1c+T7x0Dm+FxMY="
  retries = 0
}

step "kube-init" {
  wkdir   = "ingress-nginx"
  target  = "ingress-nginx/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "d9e0320fe87ea41f81b6af339d204fa19864f3031b54738f61b1b566df7ec0c8"
  retries = 0
}

step "crds" {
  wkdir   = "ingress-nginx"
  target  = "ingress-nginx/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "ingress-nginx",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
}

step "bounce" {
  wkdir   = "ingress-nginx"
  target  = "ingress-nginx/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "ingress-nginx",
  ]

  sha     = "h1:VRPIdSaxdQUIW8hXz8xpSLwVukB4do3A8okhxBjTQYU="
  retries = 1
}
