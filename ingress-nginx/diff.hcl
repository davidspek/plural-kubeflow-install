metadata {
  path = "ingress-nginx"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "ingress-nginx/terraform"
  target  = "ingress-nginx/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:ghSxoJs6Xh0FUqW01rjkMH6ng2CGK1c+T7x0Dm+FxMY="
  retries = 0
}

step "terraform" {
  wkdir   = "ingress-nginx/terraform"
  target  = "ingress-nginx/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
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
    "ingress-nginx",
  ]

  sha     = "7b38a0393153ef7a17569c0dd4aea27f4c5b1180c45c409e394c7bca72885995"
  retries = 0
}

step "helm" {
  wkdir   = "ingress-nginx/helm"
  target  = "ingress-nginx/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "ingress-nginx",
  ]

  sha     = "h1:CJoDK2A9p3ADcGJAjXuXF+qmSb5VkK8M9JhwCjFhsL0="
  retries = 0
}
