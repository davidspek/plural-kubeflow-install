metadata {
  path = "grafana-tempo"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "grafana-tempo/terraform"
  target  = "grafana-tempo/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:o+hRX4IH5UwtZyoMOx5wGzPq3RaMNXfVBmDNXU2Q8N8="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "grafana-tempo/terraform"
  target  = "grafana-tempo/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:o+hRX4IH5UwtZyoMOx5wGzPq3RaMNXfVBmDNXU2Q8N8="
  retries = 1
}

step "terraform-output" {
  wkdir   = "grafana-tempo"
  target  = "grafana-tempo/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "grafana-tempo",
  ]

  sha     = "h1:o+hRX4IH5UwtZyoMOx5wGzPq3RaMNXfVBmDNXU2Q8N8="
  retries = 0
}

step "kube-init" {
  wkdir   = "grafana-tempo"
  target  = "grafana-tempo/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "b3d7c5e6fcbe47fd6a78a58ab21a73147e445c2f8041fea869573ae9a9eaf224"
  retries = 0
}

step "crds" {
  wkdir   = "grafana-tempo"
  target  = "grafana-tempo/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "grafana-tempo",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
}

step "bounce" {
  wkdir   = "grafana-tempo"
  target  = "grafana-tempo/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "grafana-tempo",
  ]

  sha     = "h1:J4/rytOM/0YBUncYW+XCfE2qzRJaHSNrF8yAp8QQfdE="
  retries = 1
}
