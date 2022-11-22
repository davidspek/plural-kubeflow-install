metadata {
  path = "grafana"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "grafana/terraform"
  target  = "grafana/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:++Puz5GUt7ggqR2nVI8+heKdNNSowRlG/WOgF7d3KAM="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "grafana/terraform"
  target  = "grafana/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:++Puz5GUt7ggqR2nVI8+heKdNNSowRlG/WOgF7d3KAM="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "grafana"
  target  = "grafana/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
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
  ]

  sha     = "a05345bd1c8a5d417bba7378133af8d04fe44122cacbb1ff50d66c40f7bc93f7"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "grafana"
  target  = "grafana/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "grafana",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "grafana"
  target  = "grafana/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "grafana",
  ]

  sha     = "h1:0CizDSHxmezv7QWEqTtf9cQBTnXTb6B9QyVt2aRYdkM="
  retries = 2
  verbose = false
}
