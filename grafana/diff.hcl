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

  sha     = "eea7c8e7082b346a69ada15419c11cc9ca417a4249658b5b5f6a7ba894f23c61"
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

  sha     = "h1:HgP59NLbHiou9OIj9mdV0RkI5WynzFO2qLeDysUj1C4="
  retries = 0
  verbose = false
}
