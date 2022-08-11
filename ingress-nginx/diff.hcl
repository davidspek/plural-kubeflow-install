metadata {
  path = "ingress-nginx"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "ingress-nginx/terraform"
  target  = "ingress-nginx/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:lHsBatr6hj2T8n9mwlQV9WWXU34fuOvwKu7t8NE8dsA="
  retries = 0
  verbose = false
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

  sha     = "h1:lHsBatr6hj2T8n9mwlQV9WWXU34fuOvwKu7t8NE8dsA="
  retries = 0
  verbose = false
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

  sha     = "e9d2d61d96692ae1a85c118df1530f46f5ca5403f6cf612d875c9e1da94041b9"
  retries = 0
  verbose = false
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

  sha     = "h1:d+K0n429CbUHeh1tEIgjXm13pHW5pLNR+J0ryU+dZ/E="
  retries = 0
  verbose = false
}
