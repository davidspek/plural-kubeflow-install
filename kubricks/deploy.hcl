metadata {
  path = "kubricks"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "kubricks/terraform"
  target  = "kubricks/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:8EKpl9qDLBn5JsW+vvaVIiThHU306e/8sFL0qTFGEYA="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "kubricks/terraform"
  target  = "kubricks/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:8EKpl9qDLBn5JsW+vvaVIiThHU306e/8sFL0qTFGEYA="
  retries = 1
  verbose = false
}

step "terraform-output" {
  wkdir   = "kubricks"
  target  = "kubricks/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
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
  ]

  sha     = "c0ffe22d4bc05e6a364ecd5d2d1adf3c9af1325126fae9556780b471286971b8"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "kubricks"
  target  = "kubricks/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "kubricks",
  ]

  sha     = "h1:NFae7mj2oq0KAfAccJxVMh7kqCfj1Ieb/ITHC31Q0aI="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "kubricks"
  target  = "kubricks/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "kubricks",
  ]

  sha     = "h1:89Sgd6S3Pe6YBqK8E43oFdcAWgnjb+9CbqVPNGSbZEo="
  retries = 1
  verbose = false
}
