metadata {
  path = "grafana"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "grafana/terraform"
  target  = "grafana/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:++Puz5GUt7ggqR2nVI8+heKdNNSowRlG/WOgF7d3KAM="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "grafana/terraform"
  target  = "grafana/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "grafana",
  ]

  sha     = "h1:++Puz5GUt7ggqR2nVI8+heKdNNSowRlG/WOgF7d3KAM="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "grafana"
  target  = "grafana/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "grafana",
  ]

  sha     = "8a784639722846ae6f3fb6af6eadf8c23fa38eedff615fab05587666be69a042"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "grafana/helm"
  target  = "grafana/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "grafana",
  ]

  sha     = "h1:eX9mbq8mDtTJaDtraGDXEntgn+E4q3kYovOldjmzKbQ="
  retries = 0
  verbose = false
}
