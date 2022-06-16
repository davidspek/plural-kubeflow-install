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

  sha     = "e16edf14c6b4d021d744e330a656e098fda95a487d812a72e5af8c82bde935f5"
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

  sha     = "h1:G++fs5YKHoOQWQ35gAnoZDnRUmYzp7RVrch4TyFNgzE="
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

  sha     = "h1:FnwRKRplSDaRaCHAFF+H6IOpO/hqqCQptI5xFTLqcyY="
  retries = 1
  verbose = false
}
