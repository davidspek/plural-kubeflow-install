metadata {
  path = "kubricks"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "kubricks/terraform"
  target  = "kubricks/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:8EKpl9qDLBn5JsW+vvaVIiThHU306e/8sFL0qTFGEYA="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "kubricks/terraform"
  target  = "kubricks/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "kubricks",
  ]

  sha     = "h1:8EKpl9qDLBn5JsW+vvaVIiThHU306e/8sFL0qTFGEYA="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "kubricks"
  target  = "kubricks/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "kubricks",
  ]

  sha     = "e15c48d1d7a0e63c91235d4ee930c71695eac0e57ede7ff0db29496f2662b940"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "kubricks/helm"
  target  = "kubricks/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "kubricks",
  ]

  sha     = "h1:bVs3tSWFSuj8ke5H58f4JPpeHaqODJxpWS/w60xAz7o="
  retries = 0
  verbose = false
}
