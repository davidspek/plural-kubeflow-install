metadata {
  path = "grafana-tempo"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "grafana-tempo/terraform"
  target  = "grafana-tempo/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:o+hRX4IH5UwtZyoMOx5wGzPq3RaMNXfVBmDNXU2Q8N8="
  retries = 0
}

step "terraform" {
  wkdir   = "grafana-tempo/terraform"
  target  = "grafana-tempo/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
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
    "grafana-tempo",
  ]

  sha     = "de5224633406cebb0da42b004c3ed5bb5395862c5f958725d91f5736347fb619"
  retries = 0
}

step "helm" {
  wkdir   = "grafana-tempo/helm"
  target  = "grafana-tempo/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "grafana-tempo",
  ]

  sha     = "h1:IjyeDcf53NysBE7tgwHQPddUmymq5tKlpyen5L8Xglw="
  retries = 0
}
