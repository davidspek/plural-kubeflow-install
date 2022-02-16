metadata {
  path = "kubecost"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "kubecost/terraform"
  target  = "kubecost/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:fWYL6gmyXT0XZmxqdH3pLGPUEVTQ7JqhBhk+0sOsPnQ="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "kubecost/terraform"
  target  = "kubecost/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:fWYL6gmyXT0XZmxqdH3pLGPUEVTQ7JqhBhk+0sOsPnQ="
  retries = 1
}

step "terraform-output" {
  wkdir   = "kubecost"
  target  = "kubecost/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "kubecost",
  ]

  sha     = "h1:fWYL6gmyXT0XZmxqdH3pLGPUEVTQ7JqhBhk+0sOsPnQ="
  retries = 0
}

step "kube-init" {
  wkdir   = "kubecost"
  target  = "kubecost/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "472b23674b54bb575832d5830fd9468a1dc6ce9834c2c5eecab8dc03b9a9bf3f"
  retries = 0
}

step "crds" {
  wkdir   = "kubecost"
  target  = "kubecost/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "kubecost",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
}

step "bounce" {
  wkdir   = "kubecost"
  target  = "kubecost/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "kubecost",
  ]

  sha     = "h1:P2OsyLYt9OBYvQ+sNt8pvyYI7ck9HKn2kGB8zxpdJu0="
  retries = 1
}
