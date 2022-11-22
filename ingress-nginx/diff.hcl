metadata {
  path = "ingress-nginx"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "ingress-nginx/terraform"
  target  = "ingress-nginx/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:WiC/02Yp2tJQIvUfUIfLv8+FFq71J5ne02YkXTDi/gs="
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

  sha     = "h1:WiC/02Yp2tJQIvUfUIfLv8+FFq71J5ne02YkXTDi/gs="
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

  sha     = "16ccb2a856b51a89d7bdde40453dbf1dded60d8b0dc27b01daf03704c8c11f1f"
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

  sha     = "h1:4wBn/de19oW10XPyuu1Cqw4STYm7apGJt90tdW+UWR0="
  retries = 0
  verbose = false
}
